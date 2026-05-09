; DESCRIPTION: Places a cyan line segment connecting (225, 97) to (397, 21).
; PLAN: r0=225(x1), r1=97(y1), r2=397(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 97
LDI r2, 397
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
