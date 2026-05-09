; DESCRIPTION: Draws a cyan rectangle at (134, 127) with width 106 and height 108.
; PLAN: r0=134(x), r1=127(y), r2=106(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 127
LDI r2, 106
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
