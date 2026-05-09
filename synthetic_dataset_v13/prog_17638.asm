; DESCRIPTION: Draws a cyan rectangle at (55, 114) with width 28 and height 114.
; PLAN: r0=55(x), r1=114(y), r2=28(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 114
LDI r2, 28
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
