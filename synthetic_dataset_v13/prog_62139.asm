; DESCRIPTION: Places a cyan line segment connecting (397, 121) to (233, 56).
; PLAN: r0=397(x1), r1=121(y1), r2=233(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 121
LDI r2, 233
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
