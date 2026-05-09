; DESCRIPTION: Places a magenta line segment connecting (110, 164) to (53, 129).
; PLAN: r0=110(x1), r1=164(y1), r2=53(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 164
LDI r2, 53
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
