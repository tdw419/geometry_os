; DESCRIPTION: Places a cyan line segment connecting (42, 141) to (397, 110).
; PLAN: r0=42(x1), r1=141(y1), r2=397(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 141
LDI r2, 397
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
