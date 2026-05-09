; DESCRIPTION: Draws a black rectangle at (239, 79) with width 59 and height 69.
; PLAN: r0=239(x), r1=79(y), r2=59(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 79
LDI r2, 59
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
