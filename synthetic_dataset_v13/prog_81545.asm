; DESCRIPTION: Draws a blue rectangle at (4, 190) with width 10 and height 46.
; PLAN: r0=4(x), r1=190(y), r2=10(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 190
LDI r2, 10
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
