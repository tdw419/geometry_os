; DESCRIPTION: Draws a cyan rectangle at (268, 77) with width 36 and height 15.
; PLAN: r0=268(x), r1=77(y), r2=36(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 77
LDI r2, 36
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
