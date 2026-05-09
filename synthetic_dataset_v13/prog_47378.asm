; DESCRIPTION: Places a magenta line segment connecting (293, 130) to (293, 97).
; PLAN: r0=293(x1), r1=130(y1), r2=293(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 130
LDI r2, 293
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
