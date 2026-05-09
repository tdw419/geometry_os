; DESCRIPTION: Draws a cyan rectangle at (105, 95) with width 51 and height 99.
; PLAN: r0=105(x), r1=95(y), r2=51(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 95
LDI r2, 51
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
