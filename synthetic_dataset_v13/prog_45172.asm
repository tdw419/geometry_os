; DESCRIPTION: Draws a green rectangle at (202, 41) with width 19 and height 61.
; PLAN: r0=202(x), r1=41(y), r2=19(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 41
LDI r2, 19
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
