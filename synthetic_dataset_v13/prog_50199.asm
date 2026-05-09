; DESCRIPTION: Places a blue line segment connecting (128, 138) to (253, 240).
; PLAN: r0=128(x1), r1=138(y1), r2=253(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 138
LDI r2, 253
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
