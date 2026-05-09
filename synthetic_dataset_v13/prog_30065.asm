; DESCRIPTION: Draws a purple rectangle at (294, 28) with width 10 and height 21.
; PLAN: r0=294(x), r1=28(y), r2=10(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 28
LDI r2, 10
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
