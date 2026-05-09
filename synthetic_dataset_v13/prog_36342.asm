; DESCRIPTION: Draws a black rectangle at (349, 157) with width 65 and height 95.
; PLAN: r0=349(x), r1=157(y), r2=65(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 157
LDI r2, 65
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
