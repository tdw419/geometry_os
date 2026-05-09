; DESCRIPTION: Draws a cyan rectangle at (324, 97) with width 14 and height 55.
; PLAN: r0=324(x), r1=97(y), r2=14(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 97
LDI r2, 14
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
