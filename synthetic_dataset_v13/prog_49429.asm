; DESCRIPTION: Draws a purple rectangle at (128, 71) with width 120 and height 60.
; PLAN: r0=128(x), r1=71(y), r2=120(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 71
LDI r2, 120
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
