; DESCRIPTION: Renders a black line between points (264, 222) and (42, 129).
; PLAN: r0=264(x1), r1=222(y1), r2=42(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 222
LDI r2, 42
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
