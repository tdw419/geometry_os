; DESCRIPTION: Renders a orange box of size 43x44 starting at (161, 81).
; PLAN: r0=161(x), r1=81(y), r2=43(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 81
LDI r2, 43
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
