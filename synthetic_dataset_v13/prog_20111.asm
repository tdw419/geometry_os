; DESCRIPTION: Draws a purple rectangle at (465, 4) with width 32 and height 100.
; PLAN: r0=465(x), r1=4(y), r2=32(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 4
LDI r2, 32
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
