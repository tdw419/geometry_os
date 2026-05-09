; DESCRIPTION: Places a magenta line segment connecting (319, 94) to (442, 172).
; PLAN: r0=319(x1), r1=94(y1), r2=442(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 94
LDI r2, 442
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
