; DESCRIPTION: Draws a cyan rectangle at (206, 97) with width 23 and height 63.
; PLAN: r0=206(x), r1=97(y), r2=23(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 97
LDI r2, 23
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
