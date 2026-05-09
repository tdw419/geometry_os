; DESCRIPTION: Draws a purple rectangle at (340, 124) with width 20 and height 72.
; PLAN: r0=340(x), r1=124(y), r2=20(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 124
LDI r2, 20
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
