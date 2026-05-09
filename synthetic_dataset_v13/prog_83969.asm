; DESCRIPTION: Draws a black rectangle at (117, 59) with width 106 and height 82.
; PLAN: r0=117(x), r1=59(y), r2=106(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 59
LDI r2, 106
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
