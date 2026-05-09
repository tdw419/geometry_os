; DESCRIPTION: Draws a cyan rectangle at (153, 0) with width 97 and height 18.
; PLAN: r0=153(x), r1=0(y), r2=97(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 0
LDI r2, 97
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
