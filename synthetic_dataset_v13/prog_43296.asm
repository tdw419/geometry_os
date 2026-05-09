; DESCRIPTION: Places a purple line segment connecting (69, 213) to (74, 30).
; PLAN: r0=69(x1), r1=213(y1), r2=74(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 213
LDI r2, 74
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
