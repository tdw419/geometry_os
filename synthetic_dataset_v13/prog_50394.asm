; DESCRIPTION: Draws a magenta line from (496, 10) to (326, 123).
; PLAN: r0=496(x1), r1=10(y1), r2=326(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 10
LDI r2, 326
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
