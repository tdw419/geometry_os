; DESCRIPTION: Places a magenta line segment connecting (198, 229) to (296, 163).
; PLAN: r0=198(x1), r1=229(y1), r2=296(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 229
LDI r2, 296
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
