; DESCRIPTION: Renders a orange box of size 26x84 starting at (319, 15).
; PLAN: r0=319(x), r1=15(y), r2=26(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 15
LDI r2, 26
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
