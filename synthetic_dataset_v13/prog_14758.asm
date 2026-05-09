; DESCRIPTION: Draws a white rectangle at (334, 17) with width 93 and height 87.
; PLAN: r0=334(x), r1=17(y), r2=93(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 17
LDI r2, 93
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
