; DESCRIPTION: Draws a cyan rectangle at (90, 108) with width 102 and height 107.
; PLAN: r0=90(x), r1=108(y), r2=102(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 108
LDI r2, 102
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
