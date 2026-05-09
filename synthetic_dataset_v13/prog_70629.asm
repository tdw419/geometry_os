; DESCRIPTION: Draws a white rectangle at (346, 58) with width 41 and height 57.
; PLAN: r0=346(x), r1=58(y), r2=41(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 58
LDI r2, 41
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
