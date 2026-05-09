; DESCRIPTION: Draws a black rectangle at (259, 52) with width 39 and height 86.
; PLAN: r0=259(x), r1=52(y), r2=39(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 52
LDI r2, 39
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
