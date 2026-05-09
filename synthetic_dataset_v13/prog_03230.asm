; DESCRIPTION: Draws a yellow rectangle at (303, 103) with width 36 and height 71.
; PLAN: r0=303(x), r1=103(y), r2=36(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 103
LDI r2, 36
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
