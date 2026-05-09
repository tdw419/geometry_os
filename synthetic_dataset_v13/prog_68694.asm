; DESCRIPTION: Draws a yellow rectangle at (179, 82) with width 119 and height 59.
; PLAN: r0=179(x), r1=82(y), r2=119(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 82
LDI r2, 119
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
