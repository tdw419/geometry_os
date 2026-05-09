; DESCRIPTION: Places a cyan line segment connecting (93, 70) to (234, 133).
; PLAN: r0=93(x1), r1=70(y1), r2=234(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 70
LDI r2, 234
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
