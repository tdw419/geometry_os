; DESCRIPTION: Draws a cyan rectangle at (115, 105) with width 15 and height 16.
; PLAN: r0=115(x), r1=105(y), r2=15(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 105
LDI r2, 15
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
