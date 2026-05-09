; DESCRIPTION: Places a magenta line segment connecting (429, 98) to (153, 220).
; PLAN: r0=429(x1), r1=98(y1), r2=153(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 98
LDI r2, 153
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
