; DESCRIPTION: Draws a white rectangle at (265, 130) with width 107 and height 48.
; PLAN: r0=265(x), r1=130(y), r2=107(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 130
LDI r2, 107
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
