; DESCRIPTION: Draws a purple rectangle at (330, 120) with width 86 and height 33.
; PLAN: r0=330(x), r1=120(y), r2=86(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 120
LDI r2, 86
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
