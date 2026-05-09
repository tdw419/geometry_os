; DESCRIPTION: Draws a cyan rectangle at (375, 41) with width 99 and height 44.
; PLAN: r0=375(x), r1=41(y), r2=99(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 41
LDI r2, 99
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
