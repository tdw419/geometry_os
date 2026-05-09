; DESCRIPTION: Renders a orange box of size 110x78 starting at (166, 21).
; PLAN: r0=166(x), r1=21(y), r2=110(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 21
LDI r2, 110
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
