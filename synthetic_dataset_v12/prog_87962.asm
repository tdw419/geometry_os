; DESCRIPTION: Draws a yellow rectangle at (317, 166) with width 14 and height 82.
; PLAN: r0=317(x), r1=166(y), r2=14(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 166
LDI r2, 14
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
