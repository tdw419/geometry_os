; DESCRIPTION: Draws a cyan rectangle at (377, 38) with width 49 and height 41.
; PLAN: r0=377(x), r1=38(y), r2=49(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 38
LDI r2, 49
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
