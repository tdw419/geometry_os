; DESCRIPTION: Places a magenta line segment connecting (128, 232) to (507, 37).
; PLAN: r0=128(x1), r1=232(y1), r2=507(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 232
LDI r2, 507
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
