; DESCRIPTION: Draws a cyan rectangle at (250, 113) with width 69 and height 98.
; PLAN: r0=250(x), r1=113(y), r2=69(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 113
LDI r2, 69
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
