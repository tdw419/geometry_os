; DESCRIPTION: Draws a green rectangle at (239, 113) with width 16 and height 58.
; PLAN: r0=239(x), r1=113(y), r2=16(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 113
LDI r2, 16
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
