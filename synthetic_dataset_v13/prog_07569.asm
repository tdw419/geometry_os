; DESCRIPTION: Draws a white rectangle at (473, 64) with width 13 and height 85.
; PLAN: r0=473(x), r1=64(y), r2=13(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 64
LDI r2, 13
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
