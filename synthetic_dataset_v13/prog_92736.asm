; DESCRIPTION: Renders a orange box of size 54x98 starting at (11, 122).
; PLAN: r0=11(x), r1=122(y), r2=54(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 122
LDI r2, 54
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
