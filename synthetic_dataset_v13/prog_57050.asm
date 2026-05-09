; DESCRIPTION: Places a magenta line segment connecting (503, 165) to (307, 147).
; PLAN: r0=503(x1), r1=165(y1), r2=307(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 165
LDI r2, 307
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
