; DESCRIPTION: Draws a white rectangle at (29, 57) with width 75 and height 82.
; PLAN: r0=29(x), r1=57(y), r2=75(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 57
LDI r2, 75
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
