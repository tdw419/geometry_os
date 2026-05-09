; DESCRIPTION: Places a cyan line segment connecting (269, 132) to (43, 34).
; PLAN: r0=269(x1), r1=132(y1), r2=43(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 132
LDI r2, 43
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
