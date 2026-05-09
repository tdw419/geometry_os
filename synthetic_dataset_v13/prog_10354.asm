; DESCRIPTION: Renders a orange box of size 43x74 starting at (24, 157).
; PLAN: r0=24(x), r1=157(y), r2=43(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 157
LDI r2, 43
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
