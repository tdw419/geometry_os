; DESCRIPTION: Draws a black rectangle at (398, 73) with width 69 and height 43.
; PLAN: r0=398(x), r1=73(y), r2=69(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 73
LDI r2, 69
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
