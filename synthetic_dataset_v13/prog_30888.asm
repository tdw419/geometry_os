; DESCRIPTION: Draws a cyan rectangle at (8, 61) with width 105 and height 14.
; PLAN: r0=8(x), r1=61(y), r2=105(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 61
LDI r2, 105
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
