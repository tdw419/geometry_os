; DESCRIPTION: Draws a cyan rectangle at (343, 45) with width 85 and height 29.
; PLAN: r0=343(x), r1=45(y), r2=85(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 45
LDI r2, 85
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
