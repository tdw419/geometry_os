; DESCRIPTION: Places a purple line segment connecting (108, 57) to (284, 54).
; PLAN: r0=108(x1), r1=57(y1), r2=284(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 57
LDI r2, 284
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
