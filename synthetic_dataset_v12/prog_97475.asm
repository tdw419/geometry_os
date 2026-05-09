; DESCRIPTION: Draws a cyan rectangle at (106, 160) with width 18 and height 85.
; PLAN: r0=106(x), r1=160(y), r2=18(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 160
LDI r2, 18
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
