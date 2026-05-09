; DESCRIPTION: Draws a yellow rectangle at (295, 63) with width 113 and height 101.
; PLAN: r0=295(x), r1=63(y), r2=113(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 63
LDI r2, 113
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
