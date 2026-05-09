; DESCRIPTION: Draws a cyan rectangle at (127, 189) with width 63 and height 58.
; PLAN: r0=127(x), r1=189(y), r2=63(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 189
LDI r2, 63
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
