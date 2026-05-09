; DESCRIPTION: Draws a green rectangle at (261, 192) with width 86 and height 48.
; PLAN: r0=261(x), r1=192(y), r2=86(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 192
LDI r2, 86
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
