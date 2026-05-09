; DESCRIPTION: Draws a black rectangle at (210, 121) with width 83 and height 65.
; PLAN: r0=210(x), r1=121(y), r2=83(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 121
LDI r2, 83
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
