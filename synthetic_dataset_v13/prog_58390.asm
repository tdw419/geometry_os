; DESCRIPTION: Places a magenta line segment connecting (507, 230) to (318, 28).
; PLAN: r0=507(x1), r1=230(y1), r2=318(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 230
LDI r2, 318
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
