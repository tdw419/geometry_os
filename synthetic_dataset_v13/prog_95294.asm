; DESCRIPTION: Draws a green rectangle at (295, 116) with width 43 and height 46.
; PLAN: r0=295(x), r1=116(y), r2=43(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 116
LDI r2, 43
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
