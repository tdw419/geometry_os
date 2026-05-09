; DESCRIPTION: Places a cyan line segment connecting (4, 124) to (397, 227).
; PLAN: r0=4(x1), r1=124(y1), r2=397(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 124
LDI r2, 397
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
