; DESCRIPTION: Draws a cyan rectangle at (393, 171) with width 41 and height 29.
; PLAN: r0=393(x), r1=171(y), r2=41(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 171
LDI r2, 41
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
