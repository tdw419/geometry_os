; DESCRIPTION: Places a magenta line segment connecting (354, 229) to (193, 165).
; PLAN: r0=354(x1), r1=229(y1), r2=193(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 229
LDI r2, 193
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
