; DESCRIPTION: Draws a cyan rectangle at (5, 6) with width 115 and height 102.
; PLAN: r0=5(x), r1=6(y), r2=115(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 6
LDI r2, 115
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
