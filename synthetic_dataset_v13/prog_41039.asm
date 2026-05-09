; DESCRIPTION: Places a yellow line segment connecting (293, 206) to (397, 164).
; PLAN: r0=293(x1), r1=206(y1), r2=397(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 206
LDI r2, 397
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
