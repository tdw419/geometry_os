; DESCRIPTION: Draws a white rectangle at (329, 57) with width 109 and height 73.
; PLAN: r0=329(x), r1=57(y), r2=109(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 57
LDI r2, 109
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
