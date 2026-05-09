; DESCRIPTION: Places a magenta line segment connecting (39, 229) to (102, 230).
; PLAN: r0=39(x1), r1=229(y1), r2=102(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 229
LDI r2, 102
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
