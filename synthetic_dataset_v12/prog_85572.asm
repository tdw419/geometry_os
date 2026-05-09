; DESCRIPTION: Places a magenta line segment connecting (329, 53) to (287, 126).
; PLAN: r0=329(x1), r1=53(y1), r2=287(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 53
LDI r2, 287
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
