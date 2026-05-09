; DESCRIPTION: Draws a cyan rectangle at (43, 157) with width 117 and height 53.
; PLAN: r0=43(x), r1=157(y), r2=117(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 157
LDI r2, 117
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
