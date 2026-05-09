; DESCRIPTION: Places a purple line segment connecting (501, 249) to (489, 228).
; PLAN: r0=501(x1), r1=249(y1), r2=489(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 249
LDI r2, 489
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
