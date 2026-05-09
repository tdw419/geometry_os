; DESCRIPTION: Renders a orange box of size 43x78 starting at (42, 30).
; PLAN: r0=42(x), r1=30(y), r2=43(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 30
LDI r2, 43
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
