; DESCRIPTION: Places a blue line segment connecting (352, 9) to (220, 90).
; PLAN: r0=352(x1), r1=9(y1), r2=220(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 9
LDI r2, 220
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
