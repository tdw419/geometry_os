; DESCRIPTION: Renders a purple line between points (360, 85) and (386, 138).
; PLAN: r0=360(x1), r1=85(y1), r2=386(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 85
LDI r2, 386
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
