; DESCRIPTION: Draws a purple rectangle at (405, 86) with width 46 and height 113.
; PLAN: r0=405(x), r1=86(y), r2=46(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 86
LDI r2, 46
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
