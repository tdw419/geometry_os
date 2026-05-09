; DESCRIPTION: Draws a cyan rectangle at (367, 66) with width 100 and height 106.
; PLAN: r0=367(x), r1=66(y), r2=100(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 66
LDI r2, 100
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
