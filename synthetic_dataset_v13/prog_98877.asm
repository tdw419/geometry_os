; DESCRIPTION: Draws a black rectangle at (456, 58) with width 41 and height 31.
; PLAN: r0=456(x), r1=58(y), r2=41(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 58
LDI r2, 41
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
