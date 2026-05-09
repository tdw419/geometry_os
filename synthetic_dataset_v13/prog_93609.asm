; DESCRIPTION: Draws a white rectangle at (417, 128) with width 49 and height 81.
; PLAN: r0=417(x), r1=128(y), r2=49(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 128
LDI r2, 49
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
