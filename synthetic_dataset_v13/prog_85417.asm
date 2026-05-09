; DESCRIPTION: Draws a black rectangle at (272, 46) with width 25 and height 58.
; PLAN: r0=272(x), r1=46(y), r2=25(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 46
LDI r2, 25
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
