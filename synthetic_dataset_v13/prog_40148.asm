; DESCRIPTION: Draws a green rectangle at (152, 63) with width 31 and height 63.
; PLAN: r0=152(x), r1=63(y), r2=31(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 63
LDI r2, 31
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
