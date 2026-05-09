; DESCRIPTION: Draws a yellow rectangle at (272, 56) with width 90 and height 18.
; PLAN: r0=272(x), r1=56(y), r2=90(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 56
LDI r2, 90
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
