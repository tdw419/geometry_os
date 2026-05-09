; DESCRIPTION: Draws a white rectangle at (20, 163) with width 88 and height 48.
; PLAN: r0=20(x), r1=163(y), r2=88(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 163
LDI r2, 88
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
