; DESCRIPTION: Draws a purple rectangle at (480, 109) with width 31 and height 107.
; PLAN: r0=480(x), r1=109(y), r2=31(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 109
LDI r2, 31
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
