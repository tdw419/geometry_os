; DESCRIPTION: Draws a black rectangle at (86, 90) with width 22 and height 48.
; PLAN: r0=86(x), r1=90(y), r2=22(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 90
LDI r2, 22
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
