; DESCRIPTION: Places a cyan line segment connecting (31, 90) to (399, 108).
; PLAN: r0=31(x1), r1=90(y1), r2=399(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 90
LDI r2, 399
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
