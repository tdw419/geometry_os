; DESCRIPTION: Draws a purple rectangle at (372, 58) with width 86 and height 46.
; PLAN: r0=372(x), r1=58(y), r2=86(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 58
LDI r2, 86
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
