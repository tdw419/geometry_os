; DESCRIPTION: Places a cyan line segment connecting (411, 123) to (461, 123).
; PLAN: r0=411(x1), r1=123(y1), r2=461(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 123
LDI r2, 461
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
