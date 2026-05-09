; DESCRIPTION: Draws a white rectangle at (373, 2) with width 13 and height 16.
; PLAN: r0=373(x), r1=2(y), r2=13(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 2
LDI r2, 13
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
