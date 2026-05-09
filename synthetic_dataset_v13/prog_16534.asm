; DESCRIPTION: Draws a cyan rectangle at (51, 0) with width 62 and height 65.
; PLAN: r0=51(x), r1=0(y), r2=62(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 0
LDI r2, 62
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
