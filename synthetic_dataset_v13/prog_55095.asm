; DESCRIPTION: Draws a cyan rectangle at (127, 113) with width 108 and height 43.
; PLAN: r0=127(x), r1=113(y), r2=108(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 113
LDI r2, 108
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
