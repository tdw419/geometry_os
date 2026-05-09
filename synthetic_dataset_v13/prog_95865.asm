; DESCRIPTION: Places a cyan line segment connecting (331, 167) to (281, 121).
; PLAN: r0=331(x1), r1=167(y1), r2=281(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 167
LDI r2, 281
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
