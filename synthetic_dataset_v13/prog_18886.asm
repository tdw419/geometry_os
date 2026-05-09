; DESCRIPTION: Places a blue line segment connecting (12, 253) to (307, 205).
; PLAN: r0=12(x1), r1=253(y1), r2=307(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 253
LDI r2, 307
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
