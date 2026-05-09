; DESCRIPTION: Draws a cyan rectangle at (409, 136) with width 18 and height 63.
; PLAN: r0=409(x), r1=136(y), r2=18(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 136
LDI r2, 18
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
