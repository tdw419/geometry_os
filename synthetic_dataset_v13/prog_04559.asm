; DESCRIPTION: Draws a green rectangle at (224, 81) with width 81 and height 86.
; PLAN: r0=224(x), r1=81(y), r2=81(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 81
LDI r2, 81
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
