; DESCRIPTION: Places a cyan line segment connecting (82, 22) to (149, 205).
; PLAN: r0=82(x1), r1=22(y1), r2=149(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 22
LDI r2, 149
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
