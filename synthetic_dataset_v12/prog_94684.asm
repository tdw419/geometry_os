; DESCRIPTION: Places a red line segment connecting (163, 99) to (19, 42).
; PLAN: r0=163(x1), r1=99(y1), r2=19(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 99
LDI r2, 19
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
