; DESCRIPTION: Draws a cyan rectangle at (85, 127) with width 98 and height 44.
; PLAN: r0=85(x), r1=127(y), r2=98(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 127
LDI r2, 98
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
