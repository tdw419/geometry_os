; DESCRIPTION: Draws a cyan rectangle at (137, 172) with width 44 and height 62.
; PLAN: r0=137(x), r1=172(y), r2=44(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 172
LDI r2, 44
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
