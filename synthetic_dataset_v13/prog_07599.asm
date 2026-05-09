; DESCRIPTION: Draws a cyan rectangle at (136, 40) with width 18 and height 12.
; PLAN: r0=136(x), r1=40(y), r2=18(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 40
LDI r2, 18
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
