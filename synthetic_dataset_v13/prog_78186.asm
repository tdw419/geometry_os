; DESCRIPTION: Places a white line segment connecting (18, 173) to (156, 15).
; PLAN: r0=18(x1), r1=173(y1), r2=156(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 173
LDI r2, 156
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
