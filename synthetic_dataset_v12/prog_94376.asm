; DESCRIPTION: Draws a purple rectangle at (487, 119) with width 22 and height 46.
; PLAN: r0=487(x), r1=119(y), r2=22(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 119
LDI r2, 22
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
