; DESCRIPTION: Places a cyan line segment connecting (78, 164) to (55, 116).
; PLAN: r0=78(x1), r1=164(y1), r2=55(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 164
LDI r2, 55
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
