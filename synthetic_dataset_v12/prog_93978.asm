; DESCRIPTION: Places a cyan line segment connecting (287, 137) to (438, 43).
; PLAN: r0=287(x1), r1=137(y1), r2=438(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 137
LDI r2, 438
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
