; DESCRIPTION: Places a magenta line segment connecting (293, 63) to (126, 15).
; PLAN: r0=293(x1), r1=63(y1), r2=126(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 63
LDI r2, 126
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
