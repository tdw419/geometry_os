; DESCRIPTION: Places a magenta line segment connecting (150, 37) to (217, 99).
; PLAN: r0=150(x1), r1=37(y1), r2=217(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 37
LDI r2, 217
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
