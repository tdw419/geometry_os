; DESCRIPTION: Draws a cyan rectangle at (65, 43) with width 111 and height 55.
; PLAN: r0=65(x), r1=43(y), r2=111(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 43
LDI r2, 111
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
