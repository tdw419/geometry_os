; DESCRIPTION: Draws a purple rectangle at (212, 10) with width 27 and height 50.
; PLAN: r0=212(x), r1=10(y), r2=27(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 10
LDI r2, 27
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
