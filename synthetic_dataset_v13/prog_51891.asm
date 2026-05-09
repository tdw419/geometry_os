; DESCRIPTION: Draws a white rectangle at (192, 175) with width 71 and height 16.
; PLAN: r0=192(x), r1=175(y), r2=71(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 175
LDI r2, 71
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
