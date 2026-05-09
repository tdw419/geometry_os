; DESCRIPTION: Draws a black rectangle at (224, 110) with width 86 and height 68.
; PLAN: r0=224(x), r1=110(y), r2=86(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 110
LDI r2, 86
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
