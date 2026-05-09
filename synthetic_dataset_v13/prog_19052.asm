; DESCRIPTION: Places a cyan line segment connecting (4, 149) to (3, 116).
; PLAN: r0=4(x1), r1=149(y1), r2=3(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 149
LDI r2, 3
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
