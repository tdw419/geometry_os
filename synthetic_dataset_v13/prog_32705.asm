; DESCRIPTION: Draws a purple rectangle at (115, 228) with width 18 and height 20.
; PLAN: r0=115(x), r1=228(y), r2=18(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 228
LDI r2, 18
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
