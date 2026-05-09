; DESCRIPTION: Draws a purple rectangle at (346, 154) with width 115 and height 83.
; PLAN: r0=346(x), r1=154(y), r2=115(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 154
LDI r2, 115
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
