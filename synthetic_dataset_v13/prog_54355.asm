; DESCRIPTION: Renders a orange box of size 38x85 starting at (332, 77).
; PLAN: r0=332(x), r1=77(y), r2=38(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 77
LDI r2, 38
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
