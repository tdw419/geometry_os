; DESCRIPTION: Draws a white rectangle at (48, 13) with width 112 and height 118.
; PLAN: r0=48(x), r1=13(y), r2=112(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 13
LDI r2, 112
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
