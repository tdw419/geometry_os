; DESCRIPTION: Draws a white rectangle at (354, 54) with width 93 and height 39.
; PLAN: r0=354(x), r1=54(y), r2=93(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 54
LDI r2, 93
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
