; DESCRIPTION: Draws a cyan rectangle at (124, 145) with width 97 and height 49.
; PLAN: r0=124(x), r1=145(y), r2=97(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 145
LDI r2, 97
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
