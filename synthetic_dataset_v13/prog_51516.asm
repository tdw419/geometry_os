; DESCRIPTION: Draws a yellow rectangle at (279, 239) with width 113 and height 10.
; PLAN: r0=279(x), r1=239(y), r2=113(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 239
LDI r2, 113
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
