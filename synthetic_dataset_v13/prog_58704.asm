; DESCRIPTION: Draws a red rectangle at (298, 41) with width 28 and height 46.
; PLAN: r0=298(x), r1=41(y), r2=28(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 41
LDI r2, 28
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
