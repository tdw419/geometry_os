; DESCRIPTION: Places a blue line segment connecting (354, 32) to (253, 25).
; PLAN: r0=354(x1), r1=32(y1), r2=253(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 32
LDI r2, 253
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
