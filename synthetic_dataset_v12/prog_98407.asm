; DESCRIPTION: Draws a cyan rectangle at (376, 138) with width 37 and height 66.
; PLAN: r0=376(x), r1=138(y), r2=37(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 138
LDI r2, 37
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
