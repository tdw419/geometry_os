; DESCRIPTION: Draws a purple rectangle at (4, 27) with width 23 and height 111.
; PLAN: r0=4(x), r1=27(y), r2=23(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 27
LDI r2, 23
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
