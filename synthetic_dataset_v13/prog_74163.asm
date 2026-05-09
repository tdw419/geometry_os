; DESCRIPTION: Places a white line segment connecting (104, 181) to (397, 127).
; PLAN: r0=104(x1), r1=181(y1), r2=397(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 181
LDI r2, 397
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
