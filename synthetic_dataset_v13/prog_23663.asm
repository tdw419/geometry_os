; DESCRIPTION: Places a purple line segment connecting (252, 39) to (229, 113).
; PLAN: r0=252(x1), r1=39(y1), r2=229(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 39
LDI r2, 229
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
