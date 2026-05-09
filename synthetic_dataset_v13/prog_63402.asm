; DESCRIPTION: Draws a black rectangle at (185, 62) with width 45 and height 14.
; PLAN: r0=185(x), r1=62(y), r2=45(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 62
LDI r2, 45
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
