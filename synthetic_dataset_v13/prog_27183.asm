; DESCRIPTION: Places a cyan line segment connecting (31, 96) to (231, 122).
; PLAN: r0=31(x1), r1=96(y1), r2=231(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 96
LDI r2, 231
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
