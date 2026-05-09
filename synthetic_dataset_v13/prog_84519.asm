; DESCRIPTION: Draws a cyan rectangle at (14, 114) with width 108 and height 65.
; PLAN: r0=14(x), r1=114(y), r2=108(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 114
LDI r2, 108
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
