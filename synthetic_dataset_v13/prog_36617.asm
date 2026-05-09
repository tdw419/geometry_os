; DESCRIPTION: Places a cyan line segment connecting (157, 212) to (80, 18).
; PLAN: r0=157(x1), r1=212(y1), r2=80(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 212
LDI r2, 80
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
