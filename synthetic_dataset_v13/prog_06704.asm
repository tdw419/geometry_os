; DESCRIPTION: Draws a purple rectangle at (379, 44) with width 21 and height 65.
; PLAN: r0=379(x), r1=44(y), r2=21(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 44
LDI r2, 21
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
