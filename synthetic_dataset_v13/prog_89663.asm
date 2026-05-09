; DESCRIPTION: Draws a white rectangle at (224, 3) with width 49 and height 108.
; PLAN: r0=224(x), r1=3(y), r2=49(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 3
LDI r2, 49
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
