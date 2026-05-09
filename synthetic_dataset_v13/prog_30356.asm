; DESCRIPTION: Places a magenta line segment connecting (407, 201) to (479, 11).
; PLAN: r0=407(x1), r1=201(y1), r2=479(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 201
LDI r2, 479
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
