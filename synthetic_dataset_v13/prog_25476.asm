; DESCRIPTION: Renders a yellow line between points (397, 22) and (371, 103).
; PLAN: r0=397(x1), r1=22(y1), r2=371(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 22
LDI r2, 371
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
