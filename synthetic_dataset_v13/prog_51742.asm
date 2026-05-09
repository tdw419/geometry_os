; DESCRIPTION: Draws a yellow rectangle at (329, 140) with width 60 and height 41.
; PLAN: r0=329(x), r1=140(y), r2=60(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 140
LDI r2, 60
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
