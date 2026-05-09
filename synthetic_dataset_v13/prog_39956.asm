; DESCRIPTION: Draws a magenta line from (207, 254) to (325, 61).
; PLAN: r0=207(x1), r1=254(y1), r2=325(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 254
LDI r2, 325
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
