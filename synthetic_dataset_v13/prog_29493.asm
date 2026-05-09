; DESCRIPTION: Renders a orange box of size 25x35 starting at (358, 156).
; PLAN: r0=358(x), r1=156(y), r2=25(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 156
LDI r2, 25
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
