; DESCRIPTION: Draws a yellow rectangle at (30, 236) with width 24 and height 17.
; PLAN: r0=30(x), r1=236(y), r2=24(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 236
LDI r2, 24
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
