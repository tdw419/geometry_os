; DESCRIPTION: Places a yellow line segment connecting (229, 178) to (335, 198).
; PLAN: r0=229(x1), r1=178(y1), r2=335(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 178
LDI r2, 335
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
