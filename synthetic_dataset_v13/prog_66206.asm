; DESCRIPTION: Draws a black rectangle at (178, 55) with width 33 and height 55.
; PLAN: r0=178(x), r1=55(y), r2=33(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 55
LDI r2, 33
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
