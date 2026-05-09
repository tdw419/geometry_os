; DESCRIPTION: Draws a blue rectangle at (42, 190) with width 101 and height 12.
; PLAN: r0=42(x), r1=190(y), r2=101(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 190
LDI r2, 101
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
