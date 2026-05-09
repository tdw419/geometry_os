; DESCRIPTION: Draws a white rectangle at (224, 166) with width 97 and height 55.
; PLAN: r0=224(x), r1=166(y), r2=97(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 166
LDI r2, 97
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
