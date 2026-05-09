; DESCRIPTION: Draws a cyan rectangle at (310, 94) with width 58 and height 13.
; PLAN: r0=310(x), r1=94(y), r2=58(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 94
LDI r2, 58
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
