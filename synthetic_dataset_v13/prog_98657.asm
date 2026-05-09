; DESCRIPTION: Draws a purple line from (240, 126) to (360, 35).
; PLAN: r0=240(x1), r1=126(y1), r2=360(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 126
LDI r2, 360
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
