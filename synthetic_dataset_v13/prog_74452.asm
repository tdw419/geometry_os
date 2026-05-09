; DESCRIPTION: Draws a cyan rectangle at (105, 21) with width 106 and height 19.
; PLAN: r0=105(x), r1=21(y), r2=106(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 21
LDI r2, 106
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
