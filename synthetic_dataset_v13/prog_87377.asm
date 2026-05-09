; DESCRIPTION: Draws a green rectangle at (224, 193) with width 98 and height 48.
; PLAN: r0=224(x), r1=193(y), r2=98(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 193
LDI r2, 98
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
