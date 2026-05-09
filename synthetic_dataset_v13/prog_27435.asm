; DESCRIPTION: Draws a purple rectangle at (262, 56) with width 48 and height 44.
; PLAN: r0=262(x), r1=56(y), r2=48(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 56
LDI r2, 48
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
