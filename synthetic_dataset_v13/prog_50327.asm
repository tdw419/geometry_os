; DESCRIPTION: Draws a yellow rectangle at (349, 121) with width 72 and height 23.
; PLAN: r0=349(x), r1=121(y), r2=72(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 121
LDI r2, 72
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
