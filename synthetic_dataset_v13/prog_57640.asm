; DESCRIPTION: Places a cyan line segment connecting (134, 169) to (333, 35).
; PLAN: r0=134(x1), r1=169(y1), r2=333(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 169
LDI r2, 333
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
