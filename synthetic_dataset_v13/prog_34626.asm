; DESCRIPTION: Places a red line segment connecting (382, 40) to (510, 224).
; PLAN: r0=382(x1), r1=40(y1), r2=510(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 40
LDI r2, 510
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
