; DESCRIPTION: Renders a orange box of size 39x49 starting at (203, 138).
; PLAN: r0=203(x), r1=138(y), r2=39(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 138
LDI r2, 39
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
