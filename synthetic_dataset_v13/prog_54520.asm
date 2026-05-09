; DESCRIPTION: Draws a cyan rectangle at (407, 5) with width 77 and height 74.
; PLAN: r0=407(x), r1=5(y), r2=77(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 5
LDI r2, 77
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
