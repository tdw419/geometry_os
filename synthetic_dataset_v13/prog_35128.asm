; DESCRIPTION: Renders a white box of size 44x102 starting at (88, 30).
; PLAN: r0=88(x), r1=30(y), r2=44(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 30
LDI r2, 44
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
