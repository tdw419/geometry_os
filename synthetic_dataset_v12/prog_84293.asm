; DESCRIPTION: Draws a blue rectangle at (237, 190) with width 114 and height 45.
; PLAN: r0=237(x), r1=190(y), r2=114(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 190
LDI r2, 114
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
