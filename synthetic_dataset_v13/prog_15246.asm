; DESCRIPTION: Draws a blue rectangle at (224, 187) with width 102 and height 48.
; PLAN: r0=224(x), r1=187(y), r2=102(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 187
LDI r2, 102
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
