; DESCRIPTION: Places a cyan line segment connecting (397, 244) to (60, 22).
; PLAN: r0=397(x1), r1=244(y1), r2=60(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 244
LDI r2, 60
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
