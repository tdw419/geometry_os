; DESCRIPTION: Draws a cyan rectangle at (169, 41) with width 83 and height 81.
; PLAN: r0=169(x), r1=41(y), r2=83(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 41
LDI r2, 83
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
