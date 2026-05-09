; DESCRIPTION: Draws a purple rectangle at (92, 222) with width 99 and height 27.
; PLAN: r0=92(x), r1=222(y), r2=99(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 222
LDI r2, 99
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
