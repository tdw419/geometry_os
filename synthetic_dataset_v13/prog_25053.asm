; DESCRIPTION: Renders a green box of size 68x114 starting at (276, 100).
; PLAN: r0=276(x), r1=100(y), r2=68(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 100
LDI r2, 68
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
