; DESCRIPTION: Draws a black rectangle at (340, 138) with width 86 and height 90.
; PLAN: r0=340(x), r1=138(y), r2=86(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 138
LDI r2, 86
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
