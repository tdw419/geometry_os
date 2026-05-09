; DESCRIPTION: Renders a black line between points (480, 175) and (12, 34).
; PLAN: r0=480(x1), r1=175(y1), r2=12(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 175
LDI r2, 12
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
