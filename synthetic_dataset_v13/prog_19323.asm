; DESCRIPTION: Draws a cyan rectangle at (340, 102) with width 41 and height 18.
; PLAN: r0=340(x), r1=102(y), r2=41(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 102
LDI r2, 41
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
