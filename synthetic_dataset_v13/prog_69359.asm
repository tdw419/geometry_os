; DESCRIPTION: Draws a white rectangle at (256, 83) with width 109 and height 115.
; PLAN: r0=256(x), r1=83(y), r2=109(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 83
LDI r2, 109
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
