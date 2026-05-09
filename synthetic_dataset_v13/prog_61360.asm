; DESCRIPTION: Draws a green rectangle at (224, 13) with width 39 and height 64.
; PLAN: r0=224(x), r1=13(y), r2=39(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 13
LDI r2, 39
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
