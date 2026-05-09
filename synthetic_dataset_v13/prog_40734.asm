; DESCRIPTION: Draws a purple rectangle at (224, 119) with width 45 and height 92.
; PLAN: r0=224(x), r1=119(y), r2=45(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 119
LDI r2, 45
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
