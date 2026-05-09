; DESCRIPTION: Draws a blue rectangle at (51, 190) with width 53 and height 64.
; PLAN: r0=51(x), r1=190(y), r2=53(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 190
LDI r2, 53
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
