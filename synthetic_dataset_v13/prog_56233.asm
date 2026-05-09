; DESCRIPTION: Draws a green rectangle at (224, 115) with width 30 and height 76.
; PLAN: r0=224(x), r1=115(y), r2=30(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 115
LDI r2, 30
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
