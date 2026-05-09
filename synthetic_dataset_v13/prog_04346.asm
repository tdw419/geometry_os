; DESCRIPTION: Draws a cyan rectangle at (107, 189) with width 84 and height 13.
; PLAN: r0=107(x), r1=189(y), r2=84(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 189
LDI r2, 84
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
