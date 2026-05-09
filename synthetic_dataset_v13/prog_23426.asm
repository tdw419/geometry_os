; DESCRIPTION: Renders a black line between points (342, 32) and (395, 65).
; PLAN: r0=342(x1), r1=32(y1), r2=395(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 32
LDI r2, 395
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
