; DESCRIPTION: Draws a purple rectangle at (46, 63) with width 99 and height 55.
; PLAN: r0=46(x), r1=63(y), r2=99(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 63
LDI r2, 99
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
