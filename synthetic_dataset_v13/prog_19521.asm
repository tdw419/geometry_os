; DESCRIPTION: Draws a cyan rectangle at (126, 37) with width 114 and height 63.
; PLAN: r0=126(x), r1=37(y), r2=114(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 37
LDI r2, 114
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
