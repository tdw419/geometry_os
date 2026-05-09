; DESCRIPTION: Places a cyan line segment connecting (38, 102) to (315, 62).
; PLAN: r0=38(x1), r1=102(y1), r2=315(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 102
LDI r2, 315
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
