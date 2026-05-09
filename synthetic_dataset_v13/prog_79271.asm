; DESCRIPTION: Draws a cyan rectangle at (426, 106) with width 82 and height 90.
; PLAN: r0=426(x), r1=106(y), r2=82(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 106
LDI r2, 82
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
