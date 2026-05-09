; DESCRIPTION: Places a magenta line segment connecting (253, 16) to (2, 121).
; PLAN: r0=253(x1), r1=16(y1), r2=2(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 16
LDI r2, 2
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
