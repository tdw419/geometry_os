; DESCRIPTION: Draws a cyan rectangle at (268, 106) with width 108 and height 78.
; PLAN: r0=268(x), r1=106(y), r2=108(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 106
LDI r2, 108
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
