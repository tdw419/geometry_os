; DESCRIPTION: Places a magenta line segment connecting (370, 238) to (329, 229).
; PLAN: r0=370(x1), r1=238(y1), r2=329(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 238
LDI r2, 329
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
