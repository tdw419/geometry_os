; DESCRIPTION: Draws a cyan rectangle at (402, 170) with width 43 and height 63.
; PLAN: r0=402(x), r1=170(y), r2=43(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 170
LDI r2, 43
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
