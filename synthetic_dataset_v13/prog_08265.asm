; DESCRIPTION: Draws a white rectangle at (447, 21) with width 56 and height 41.
; PLAN: r0=447(x), r1=21(y), r2=56(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 21
LDI r2, 56
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
