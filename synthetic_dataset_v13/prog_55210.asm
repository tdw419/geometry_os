; DESCRIPTION: Draws a white rectangle at (472, 48) with width 20 and height 93.
; PLAN: r0=472(x), r1=48(y), r2=20(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 48
LDI r2, 20
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
