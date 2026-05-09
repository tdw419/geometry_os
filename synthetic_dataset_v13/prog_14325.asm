; DESCRIPTION: Draws a cyan rectangle at (179, 31) with width 66 and height 100.
; PLAN: r0=179(x), r1=31(y), r2=66(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 31
LDI r2, 66
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
