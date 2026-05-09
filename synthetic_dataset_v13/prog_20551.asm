; DESCRIPTION: Draws a cyan rectangle at (241, 62) with width 67 and height 84.
; PLAN: r0=241(x), r1=62(y), r2=67(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 62
LDI r2, 67
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
