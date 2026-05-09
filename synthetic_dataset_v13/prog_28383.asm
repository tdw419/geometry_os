; DESCRIPTION: Places a cyan line segment connecting (156, 22) to (319, 20).
; PLAN: r0=156(x1), r1=22(y1), r2=319(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 22
LDI r2, 319
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
