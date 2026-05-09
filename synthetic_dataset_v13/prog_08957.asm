; DESCRIPTION: Places a magenta line segment connecting (470, 172) to (354, 66).
; PLAN: r0=470(x1), r1=172(y1), r2=354(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 172
LDI r2, 354
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
