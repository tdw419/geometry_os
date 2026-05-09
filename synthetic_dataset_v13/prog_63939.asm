; DESCRIPTION: Places a magenta line segment connecting (158, 214) to (447, 215).
; PLAN: r0=158(x1), r1=214(y1), r2=447(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 214
LDI r2, 447
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
