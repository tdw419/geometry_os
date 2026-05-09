; DESCRIPTION: Draws a cyan rectangle at (148, 37) with width 116 and height 43.
; PLAN: r0=148(x), r1=37(y), r2=116(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 37
LDI r2, 116
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
