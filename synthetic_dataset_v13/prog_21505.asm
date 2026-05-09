; DESCRIPTION: Draws a cyan rectangle at (306, 133) with width 26 and height 111.
; PLAN: r0=306(x), r1=133(y), r2=26(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 133
LDI r2, 26
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
