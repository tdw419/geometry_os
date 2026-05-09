; DESCRIPTION: Draws a purple rectangle at (298, 40) with width 87 and height 113.
; PLAN: r0=298(x), r1=40(y), r2=87(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 40
LDI r2, 87
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
