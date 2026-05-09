; DESCRIPTION: Places a yellow line segment connecting (467, 156) to (495, 42).
; PLAN: r0=467(x1), r1=156(y1), r2=495(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 156
LDI r2, 495
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
