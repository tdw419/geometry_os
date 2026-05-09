; DESCRIPTION: Draws a cyan rectangle at (438, 114) with width 11 and height 114.
; PLAN: r0=438(x), r1=114(y), r2=11(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 114
LDI r2, 11
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
