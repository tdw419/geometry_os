; DESCRIPTION: Renders a orange box of size 105x108 starting at (282, 105).
; PLAN: r0=282(x), r1=105(y), r2=105(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 105
LDI r2, 105
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
