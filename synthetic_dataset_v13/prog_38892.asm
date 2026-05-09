; DESCRIPTION: Draws a cyan rectangle at (106, 150) with width 75 and height 71.
; PLAN: r0=106(x), r1=150(y), r2=75(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 150
LDI r2, 75
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
