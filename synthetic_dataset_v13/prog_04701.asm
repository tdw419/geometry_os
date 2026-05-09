; DESCRIPTION: Draws a purple rectangle at (406, 47) with width 106 and height 90.
; PLAN: r0=406(x), r1=47(y), r2=106(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 47
LDI r2, 106
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
