; DESCRIPTION: Draws a cyan rectangle at (13, 167) with width 69 and height 11.
; PLAN: r0=13(x), r1=167(y), r2=69(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 167
LDI r2, 69
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
