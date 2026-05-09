; DESCRIPTION: Draws a red rectangle at (478, 157) with width 24 and height 38.
; PLAN: r0=478(x), r1=157(y), r2=24(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 157
LDI r2, 24
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
