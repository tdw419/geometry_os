; DESCRIPTION: Renders a orange box of size 77x49 starting at (153, 137).
; PLAN: r0=153(x), r1=137(y), r2=77(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 137
LDI r2, 77
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
