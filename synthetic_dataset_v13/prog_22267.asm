; DESCRIPTION: Renders a white box of size 58x22 starting at (156, 85).
; PLAN: r0=156(x), r1=85(y), r2=58(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 85
LDI r2, 58
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
