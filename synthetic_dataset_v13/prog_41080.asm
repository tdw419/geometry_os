; DESCRIPTION: Draws a purple rectangle at (48, 40) with width 57 and height 10.
; PLAN: r0=48(x), r1=40(y), r2=57(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 40
LDI r2, 57
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
