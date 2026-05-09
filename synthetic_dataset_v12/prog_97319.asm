; DESCRIPTION: Renders a orange box of size 13x107 starting at (499, 148).
; PLAN: r0=499(x), r1=148(y), r2=13(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 148
LDI r2, 13
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
