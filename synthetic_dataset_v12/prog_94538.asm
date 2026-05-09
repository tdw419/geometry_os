; DESCRIPTION: Draws a black rectangle at (96, 144) with width 86 and height 13.
; PLAN: r0=96(x), r1=144(y), r2=86(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 144
LDI r2, 86
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
