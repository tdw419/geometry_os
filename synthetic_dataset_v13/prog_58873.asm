; DESCRIPTION: Places a magenta line segment connecting (6, 204) to (319, 196).
; PLAN: r0=6(x1), r1=204(y1), r2=319(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 204
LDI r2, 319
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
