; DESCRIPTION: Draws a cyan rectangle at (347, 36) with width 114 and height 44.
; PLAN: r0=347(x), r1=36(y), r2=114(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 36
LDI r2, 114
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
