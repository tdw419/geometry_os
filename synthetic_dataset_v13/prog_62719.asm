; DESCRIPTION: Draws a cyan rectangle at (226, 76) with width 51 and height 28.
; PLAN: r0=226(x), r1=76(y), r2=51(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 76
LDI r2, 51
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
