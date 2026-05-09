; DESCRIPTION: Renders a purple line between points (370, 78) and (495, 143).
; PLAN: r0=370(x1), r1=78(y1), r2=495(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 78
LDI r2, 495
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
