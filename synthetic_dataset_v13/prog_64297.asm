; DESCRIPTION: Draws a white rectangle at (150, 165) with width 86 and height 29.
; PLAN: r0=150(x), r1=165(y), r2=86(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 165
LDI r2, 86
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
