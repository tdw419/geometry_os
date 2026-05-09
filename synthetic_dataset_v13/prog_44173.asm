; DESCRIPTION: Draws a white rectangle at (6, 165) with width 120 and height 57.
; PLAN: r0=6(x), r1=165(y), r2=120(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 165
LDI r2, 120
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
