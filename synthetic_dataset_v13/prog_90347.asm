; DESCRIPTION: Draws a green rectangle at (301, 23) with width 75 and height 111.
; PLAN: r0=301(x), r1=23(y), r2=75(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 23
LDI r2, 75
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
