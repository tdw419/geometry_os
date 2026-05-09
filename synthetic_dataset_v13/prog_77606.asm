; DESCRIPTION: Draws a black rectangle at (278, 98) with width 33 and height 12.
; PLAN: r0=278(x), r1=98(y), r2=33(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 98
LDI r2, 33
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
