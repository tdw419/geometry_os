; DESCRIPTION: Places a red line segment connecting (426, 156) to (57, 37).
; PLAN: r0=426(x1), r1=156(y1), r2=57(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 156
LDI r2, 57
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
