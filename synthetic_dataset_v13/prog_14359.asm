; DESCRIPTION: Draws a purple rectangle at (301, 99) with width 115 and height 10.
; PLAN: r0=301(x), r1=99(y), r2=115(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 99
LDI r2, 115
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
