; DESCRIPTION: Places a blue line segment connecting (104, 253) to (456, 130).
; PLAN: r0=104(x1), r1=253(y1), r2=456(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 253
LDI r2, 456
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
