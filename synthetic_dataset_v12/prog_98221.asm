; DESCRIPTION: Draws a white rectangle at (285, 215) with width 113 and height 41.
; PLAN: r0=285(x), r1=215(y), r2=113(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 215
LDI r2, 113
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
