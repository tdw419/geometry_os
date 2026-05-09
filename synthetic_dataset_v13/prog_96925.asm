; DESCRIPTION: Places a cyan line segment connecting (281, 217) to (156, 244).
; PLAN: r0=281(x1), r1=217(y1), r2=156(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 217
LDI r2, 156
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
