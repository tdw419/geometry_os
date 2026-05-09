; DESCRIPTION: Renders a black line between points (325, 175) and (154, 19).
; PLAN: r0=325(x1), r1=175(y1), r2=154(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 175
LDI r2, 154
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
