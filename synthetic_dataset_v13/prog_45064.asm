; DESCRIPTION: Places a magenta line segment connecting (50, 218) to (225, 159).
; PLAN: r0=50(x1), r1=218(y1), r2=225(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 218
LDI r2, 225
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
