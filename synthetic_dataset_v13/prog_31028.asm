; DESCRIPTION: Renders a orange box of size 69x63 starting at (247, 12).
; PLAN: r0=247(x), r1=12(y), r2=69(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 12
LDI r2, 69
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
