; DESCRIPTION: Draws a cyan rectangle at (286, 17) with width 88 and height 58.
; PLAN: r0=286(x), r1=17(y), r2=88(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 17
LDI r2, 88
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
