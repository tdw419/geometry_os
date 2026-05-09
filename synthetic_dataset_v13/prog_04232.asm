; DESCRIPTION: Draws a white rectangle at (403, 175) with width 75 and height 12.
; PLAN: r0=403(x), r1=175(y), r2=75(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 175
LDI r2, 75
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
