; DESCRIPTION: Places a red line segment connecting (261, 127) to (489, 222).
; PLAN: r0=261(x1), r1=127(y1), r2=489(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 127
LDI r2, 489
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
