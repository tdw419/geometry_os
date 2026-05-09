; DESCRIPTION: Renders a orange box of size 38x105 starting at (52, 78).
; PLAN: r0=52(x), r1=78(y), r2=38(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 78
LDI r2, 38
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
