; DESCRIPTION: Draws a orange rectangle at (239, 157) with width 46 and height 64.
; PLAN: r0=239(x), r1=157(y), r2=46(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 157
LDI r2, 46
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
