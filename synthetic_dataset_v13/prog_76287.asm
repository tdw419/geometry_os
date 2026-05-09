; DESCRIPTION: Draws a purple rectangle at (193, 150) with width 105 and height 99.
; PLAN: r0=193(x), r1=150(y), r2=105(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 150
LDI r2, 105
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
