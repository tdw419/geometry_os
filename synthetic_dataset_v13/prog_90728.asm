; DESCRIPTION: Draws a purple rectangle at (259, 175) with width 120 and height 14.
; PLAN: r0=259(x), r1=175(y), r2=120(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 175
LDI r2, 120
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
