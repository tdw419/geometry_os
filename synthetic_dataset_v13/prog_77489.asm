; DESCRIPTION: Places a blue line segment connecting (489, 13) to (330, 213).
; PLAN: r0=489(x1), r1=13(y1), r2=330(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 13
LDI r2, 330
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
