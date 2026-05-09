; DESCRIPTION: Places a cyan line segment connecting (31, 60) to (274, 70).
; PLAN: r0=31(x1), r1=60(y1), r2=274(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 60
LDI r2, 274
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
