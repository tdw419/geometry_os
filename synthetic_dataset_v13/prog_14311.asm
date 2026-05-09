; DESCRIPTION: Draws a purple rectangle at (410, 137) with width 29 and height 96.
; PLAN: r0=410(x), r1=137(y), r2=29(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 137
LDI r2, 29
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
