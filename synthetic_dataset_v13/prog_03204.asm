; DESCRIPTION: Draws a purple rectangle at (318, 223) with width 120 and height 13.
; PLAN: r0=318(x), r1=223(y), r2=120(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 223
LDI r2, 120
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
