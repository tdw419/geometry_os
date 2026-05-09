; DESCRIPTION: Draws a white rectangle at (373, 183) with width 96 and height 48.
; PLAN: r0=373(x), r1=183(y), r2=96(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 183
LDI r2, 96
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
