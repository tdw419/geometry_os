; DESCRIPTION: Places a magenta line segment connecting (230, 127) to (429, 94).
; PLAN: r0=230(x1), r1=127(y1), r2=429(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 127
LDI r2, 429
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
