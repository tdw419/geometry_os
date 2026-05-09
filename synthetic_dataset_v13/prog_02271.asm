; DESCRIPTION: Draws a purple rectangle at (202, 190) with width 55 and height 37.
; PLAN: r0=202(x), r1=190(y), r2=55(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 190
LDI r2, 55
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
