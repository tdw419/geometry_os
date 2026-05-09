; DESCRIPTION: Draws a cyan rectangle at (323, 127) with width 26 and height 19.
; PLAN: r0=323(x), r1=127(y), r2=26(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 127
LDI r2, 26
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
