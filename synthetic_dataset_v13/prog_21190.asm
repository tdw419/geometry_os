; DESCRIPTION: Renders a orange box of size 69x17 starting at (408, 116).
; PLAN: r0=408(x), r1=116(y), r2=69(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 116
LDI r2, 69
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
