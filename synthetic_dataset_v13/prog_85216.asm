; DESCRIPTION: Draws a yellow rectangle at (303, 173) with width 37 and height 41.
; PLAN: r0=303(x), r1=173(y), r2=37(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 173
LDI r2, 37
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
