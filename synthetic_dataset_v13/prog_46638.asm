; DESCRIPTION: Draws a white rectangle at (262, 38) with width 41 and height 118.
; PLAN: r0=262(x), r1=38(y), r2=41(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 38
LDI r2, 41
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
