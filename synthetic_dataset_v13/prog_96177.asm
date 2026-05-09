; DESCRIPTION: Draws a red rectangle at (225, 239) with width 19 and height 15.
; PLAN: r0=225(x), r1=239(y), r2=19(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 239
LDI r2, 19
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
