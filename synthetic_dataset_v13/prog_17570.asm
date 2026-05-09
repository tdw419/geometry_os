; DESCRIPTION: Draws a cyan rectangle at (153, 51) with width 30 and height 21.
; PLAN: r0=153(x), r1=51(y), r2=30(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 51
LDI r2, 30
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
