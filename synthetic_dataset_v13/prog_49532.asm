; DESCRIPTION: Draws a black rectangle at (225, 60) with width 65 and height 83.
; PLAN: r0=225(x), r1=60(y), r2=65(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 60
LDI r2, 65
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
