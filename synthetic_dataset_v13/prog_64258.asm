; DESCRIPTION: Renders a green box of size 31x106 starting at (85, 73).
; PLAN: r0=85(x), r1=73(y), r2=31(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 73
LDI r2, 31
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
