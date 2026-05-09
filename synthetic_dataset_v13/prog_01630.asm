; DESCRIPTION: Renders a orange box of size 14x78 starting at (40, 176).
; PLAN: r0=40(x), r1=176(y), r2=14(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 176
LDI r2, 14
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
