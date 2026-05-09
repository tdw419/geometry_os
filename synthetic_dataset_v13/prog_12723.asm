; DESCRIPTION: Places a magenta line segment connecting (477, 254) to (59, 159).
; PLAN: r0=477(x1), r1=254(y1), r2=59(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 254
LDI r2, 59
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
