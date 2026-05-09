; DESCRIPTION: Places a magenta line segment connecting (325, 148) to (50, 159).
; PLAN: r0=325(x1), r1=148(y1), r2=50(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 148
LDI r2, 50
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
