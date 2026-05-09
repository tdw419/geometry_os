; DESCRIPTION: Places a magenta line segment connecting (409, 0) to (438, 126).
; PLAN: r0=409(x1), r1=0(y1), r2=438(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 0
LDI r2, 438
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
