; DESCRIPTION: Places a black line segment connecting (156, 177) to (406, 20).
; PLAN: r0=156(x1), r1=177(y1), r2=406(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 177
LDI r2, 406
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
