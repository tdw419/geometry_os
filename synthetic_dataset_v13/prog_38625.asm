; DESCRIPTION: Renders a orange box of size 25x26 starting at (244, 223).
; PLAN: r0=244(x), r1=223(y), r2=25(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 223
LDI r2, 25
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
