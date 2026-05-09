; DESCRIPTION: Places a cyan line segment connecting (397, 158) to (93, 8).
; PLAN: r0=397(x1), r1=158(y1), r2=93(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 158
LDI r2, 93
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
