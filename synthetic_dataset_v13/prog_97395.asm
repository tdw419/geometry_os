; DESCRIPTION: Draws a yellow rectangle at (134, 82) with width 46 and height 85.
; PLAN: r0=134(x), r1=82(y), r2=46(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 82
LDI r2, 46
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
