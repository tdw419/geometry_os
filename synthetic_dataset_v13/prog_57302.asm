; DESCRIPTION: Places a white line segment connecting (397, 132) to (8, 48).
; PLAN: r0=397(x1), r1=132(y1), r2=8(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 132
LDI r2, 8
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
