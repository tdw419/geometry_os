; DESCRIPTION: Renders a orange box of size 39x24 starting at (444, 53).
; PLAN: r0=444(x), r1=53(y), r2=39(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 53
LDI r2, 39
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
