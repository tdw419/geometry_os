; DESCRIPTION: Draws a yellow rectangle at (315, 134) with width 21 and height 86.
; PLAN: r0=315(x), r1=134(y), r2=21(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 134
LDI r2, 21
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
