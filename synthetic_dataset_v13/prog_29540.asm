; DESCRIPTION: Places a purple line segment connecting (366, 126) to (75, 215).
; PLAN: r0=366(x1), r1=126(y1), r2=75(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 126
LDI r2, 75
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
