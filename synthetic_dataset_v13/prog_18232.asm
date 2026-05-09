; DESCRIPTION: Places a cyan line segment connecting (24, 167) to (26, 19).
; PLAN: r0=24(x1), r1=167(y1), r2=26(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 167
LDI r2, 26
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
