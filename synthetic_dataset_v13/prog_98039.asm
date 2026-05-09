; DESCRIPTION: Draws a purple rectangle at (262, 70) with width 45 and height 71.
; PLAN: r0=262(x), r1=70(y), r2=45(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 70
LDI r2, 45
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
