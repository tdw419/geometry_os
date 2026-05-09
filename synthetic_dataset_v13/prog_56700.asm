; DESCRIPTION: Places a magenta line segment connecting (397, 140) to (160, 255).
; PLAN: r0=397(x1), r1=140(y1), r2=160(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 140
LDI r2, 160
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
