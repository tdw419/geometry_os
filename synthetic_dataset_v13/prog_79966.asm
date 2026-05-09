; DESCRIPTION: Draws a black rectangle at (86, 71) with width 83 and height 58.
; PLAN: r0=86(x), r1=71(y), r2=83(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 71
LDI r2, 83
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
