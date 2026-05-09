; DESCRIPTION: Draws a cyan rectangle at (52, 149) with width 28 and height 75.
; PLAN: r0=52(x), r1=149(y), r2=28(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 149
LDI r2, 28
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
