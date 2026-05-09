; DESCRIPTION: Draws a purple rectangle at (449, 45) with width 16 and height 83.
; PLAN: r0=449(x), r1=45(y), r2=16(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 45
LDI r2, 16
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
