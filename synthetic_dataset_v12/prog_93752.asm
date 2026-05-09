; DESCRIPTION: Renders a orange box of size 119x66 starting at (296, 165).
; PLAN: r0=296(x), r1=165(y), r2=119(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 165
LDI r2, 119
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
