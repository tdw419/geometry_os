; DESCRIPTION: Draws a yellow rectangle at (223, 39) with width 106 and height 65.
; PLAN: r0=223(x), r1=39(y), r2=106(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 39
LDI r2, 106
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
