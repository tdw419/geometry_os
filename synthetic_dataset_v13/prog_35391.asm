; DESCRIPTION: Draws a cyan rectangle at (93, 15) with width 69 and height 99.
; PLAN: r0=93(x), r1=15(y), r2=69(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 15
LDI r2, 69
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
