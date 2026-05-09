; DESCRIPTION: Draws a cyan rectangle at (185, 29) with width 108 and height 107.
; PLAN: r0=185(x), r1=29(y), r2=108(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 29
LDI r2, 108
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
