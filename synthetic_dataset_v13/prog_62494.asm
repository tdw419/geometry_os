; DESCRIPTION: Places a cyan line segment connecting (319, 10) to (158, 1).
; PLAN: r0=319(x1), r1=10(y1), r2=158(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 10
LDI r2, 158
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
