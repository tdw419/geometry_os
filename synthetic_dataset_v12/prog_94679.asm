; DESCRIPTION: Draws a magenta line from (293, 132) to (45, 131).
; PLAN: r0=293(x1), r1=132(y1), r2=45(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 132
LDI r2, 45
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
