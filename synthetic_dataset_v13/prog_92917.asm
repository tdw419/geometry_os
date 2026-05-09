; DESCRIPTION: Draws a yellow rectangle at (5, 145) with width 46 and height 82.
; PLAN: r0=5(x), r1=145(y), r2=46(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 145
LDI r2, 46
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
