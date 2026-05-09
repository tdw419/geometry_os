; DESCRIPTION: Draws a white rectangle at (303, 193) with width 86 and height 41.
; PLAN: r0=303(x), r1=193(y), r2=86(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 193
LDI r2, 86
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
