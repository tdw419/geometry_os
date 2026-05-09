; DESCRIPTION: Draws a cyan rectangle at (380, 105) with width 52 and height 81.
; PLAN: r0=380(x), r1=105(y), r2=52(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 105
LDI r2, 52
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
