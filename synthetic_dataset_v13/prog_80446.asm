; DESCRIPTION: Places a cyan line segment connecting (167, 119) to (16, 252).
; PLAN: r0=167(x1), r1=119(y1), r2=16(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 119
LDI r2, 16
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
