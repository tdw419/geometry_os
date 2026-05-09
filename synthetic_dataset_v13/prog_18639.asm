; DESCRIPTION: Draws a yellow rectangle at (303, 109) with width 72 and height 81.
; PLAN: r0=303(x), r1=109(y), r2=72(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 109
LDI r2, 72
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
