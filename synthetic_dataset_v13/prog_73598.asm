; DESCRIPTION: Draws a cyan rectangle at (410, 3) with width 90 and height 41.
; PLAN: r0=410(x), r1=3(y), r2=90(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 3
LDI r2, 90
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
