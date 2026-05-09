; DESCRIPTION: Renders a orange box of size 69x66 starting at (221, 63).
; PLAN: r0=221(x), r1=63(y), r2=69(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 63
LDI r2, 69
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
