; DESCRIPTION: Renders a orange box of size 69x112 starting at (441, 43).
; PLAN: r0=441(x), r1=43(y), r2=69(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 43
LDI r2, 69
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
