; DESCRIPTION: Draws a purple rectangle at (295, 204) with width 72 and height 47.
; PLAN: r0=295(x), r1=204(y), r2=72(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 204
LDI r2, 72
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
