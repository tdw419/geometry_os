; DESCRIPTION: Draws a cyan rectangle at (179, 117) with width 100 and height 31.
; PLAN: r0=179(x), r1=117(y), r2=100(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 117
LDI r2, 100
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
