; DESCRIPTION: Draws a purple rectangle at (294, 45) with width 85 and height 109.
; PLAN: r0=294(x), r1=45(y), r2=85(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 45
LDI r2, 85
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
