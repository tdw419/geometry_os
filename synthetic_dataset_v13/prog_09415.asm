; DESCRIPTION: Draws a white rectangle at (372, 24) with width 10 and height 81.
; PLAN: r0=372(x), r1=24(y), r2=10(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 24
LDI r2, 10
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
