; DESCRIPTION: Places a red line segment connecting (144, 64) to (436, 68).
; PLAN: r0=144(x1), r1=64(y1), r2=436(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 64
LDI r2, 436
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
