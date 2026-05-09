; DESCRIPTION: Places a purple line segment connecting (96, 213) to (360, 176).
; PLAN: r0=96(x1), r1=213(y1), r2=360(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 213
LDI r2, 360
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
