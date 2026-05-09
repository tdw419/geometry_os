; DESCRIPTION: Draws a black rectangle at (264, 121) with width 65 and height 49.
; PLAN: r0=264(x), r1=121(y), r2=65(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 121
LDI r2, 65
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
