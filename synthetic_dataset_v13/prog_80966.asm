; DESCRIPTION: Draws a white rectangle at (360, 144) with width 103 and height 93.
; PLAN: r0=360(x), r1=144(y), r2=103(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 144
LDI r2, 103
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
