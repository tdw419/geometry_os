; DESCRIPTION: Places a red line segment connecting (42, 173) to (31, 72).
; PLAN: r0=42(x1), r1=173(y1), r2=31(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 173
LDI r2, 31
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
