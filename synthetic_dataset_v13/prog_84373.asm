; DESCRIPTION: Draws a cyan rectangle at (76, 212) with width 41 and height 34.
; PLAN: r0=76(x), r1=212(y), r2=41(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 212
LDI r2, 41
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
