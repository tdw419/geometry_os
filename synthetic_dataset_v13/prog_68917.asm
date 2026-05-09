; DESCRIPTION: Draws a black rectangle at (174, 95) with width 45 and height 76.
; PLAN: r0=174(x), r1=95(y), r2=45(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 95
LDI r2, 45
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
