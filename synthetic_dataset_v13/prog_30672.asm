; DESCRIPTION: Draws a yellow rectangle at (298, 41) with width 10 and height 83.
; PLAN: r0=298(x), r1=41(y), r2=10(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 41
LDI r2, 10
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
