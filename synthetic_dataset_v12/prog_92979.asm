; DESCRIPTION: Places a magenta line segment connecting (69, 254) to (238, 234).
; PLAN: r0=69(x1), r1=254(y1), r2=238(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 254
LDI r2, 238
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
