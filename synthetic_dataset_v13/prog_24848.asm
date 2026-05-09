; DESCRIPTION: Places a cyan line segment connecting (116, 85) to (149, 48).
; PLAN: r0=116(x1), r1=85(y1), r2=149(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 85
LDI r2, 149
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
