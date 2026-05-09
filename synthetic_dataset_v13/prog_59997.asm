; DESCRIPTION: Draws a green rectangle at (219, 41) with width 77 and height 61.
; PLAN: r0=219(x), r1=41(y), r2=77(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 41
LDI r2, 77
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
