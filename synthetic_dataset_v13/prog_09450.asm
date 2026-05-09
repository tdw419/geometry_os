; DESCRIPTION: Renders a white box of size 76x100 starting at (137, 22).
; PLAN: r0=137(x), r1=22(y), r2=76(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 22
LDI r2, 76
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
