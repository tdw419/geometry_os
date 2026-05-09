; DESCRIPTION: Draws a cyan rectangle at (18, 63) with width 43 and height 13.
; PLAN: r0=18(x), r1=63(y), r2=43(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 63
LDI r2, 43
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
