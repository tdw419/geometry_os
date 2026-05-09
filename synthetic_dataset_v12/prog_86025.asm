; DESCRIPTION: Draws a orange rectangle at (239, 59) with width 76 and height 12.
; PLAN: r0=239(x), r1=59(y), r2=76(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 59
LDI r2, 76
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
