; DESCRIPTION: Draws a purple rectangle at (193, 120) with width 112 and height 117.
; PLAN: r0=193(x), r1=120(y), r2=112(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 120
LDI r2, 112
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
