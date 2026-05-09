; DESCRIPTION: Draws a cyan rectangle at (74, 22) with width 79 and height 33.
; PLAN: r0=74(x), r1=22(y), r2=79(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 22
LDI r2, 79
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
