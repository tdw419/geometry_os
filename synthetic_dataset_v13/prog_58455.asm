; DESCRIPTION: Draws a white rectangle at (247, 144) with width 110 and height 93.
; PLAN: r0=247(x), r1=144(y), r2=110(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 144
LDI r2, 110
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
