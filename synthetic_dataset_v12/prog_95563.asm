; DESCRIPTION: Places a blue line segment connecting (107, 31) to (397, 46).
; PLAN: r0=107(x1), r1=31(y1), r2=397(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 31
LDI r2, 397
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
