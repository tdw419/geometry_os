; DESCRIPTION: Draws a green rectangle at (382, 18) with width 58 and height 86.
; PLAN: r0=382(x), r1=18(y), r2=58(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 18
LDI r2, 58
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
