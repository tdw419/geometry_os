; DESCRIPTION: Renders a black line between points (264, 45) and (23, 202).
; PLAN: r0=264(x1), r1=45(y1), r2=23(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 45
LDI r2, 23
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
