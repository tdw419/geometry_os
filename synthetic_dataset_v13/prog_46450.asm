; DESCRIPTION: Draws a cyan rectangle at (414, 101) with width 35 and height 26.
; PLAN: r0=414(x), r1=101(y), r2=35(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 101
LDI r2, 35
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
