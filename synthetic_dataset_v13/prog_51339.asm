; DESCRIPTION: Renders a orange box of size 74x65 starting at (397, 155).
; PLAN: r0=397(x), r1=155(y), r2=74(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 155
LDI r2, 74
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
