; DESCRIPTION: Draws a yellow rectangle at (272, 90) with width 52 and height 10.
; PLAN: r0=272(x), r1=90(y), r2=52(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 90
LDI r2, 52
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
