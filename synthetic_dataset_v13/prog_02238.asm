; DESCRIPTION: Draws a cyan rectangle at (179, 202) with width 43 and height 45.
; PLAN: r0=179(x), r1=202(y), r2=43(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 202
LDI r2, 43
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
