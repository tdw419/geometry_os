; DESCRIPTION: Draws a white rectangle at (178, 171) with width 52 and height 24.
; PLAN: r0=178(x), r1=171(y), r2=52(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 171
LDI r2, 52
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
