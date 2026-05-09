; DESCRIPTION: Draws a cyan rectangle at (216, 119) with width 44 and height 111.
; PLAN: r0=216(x), r1=119(y), r2=44(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 119
LDI r2, 44
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
