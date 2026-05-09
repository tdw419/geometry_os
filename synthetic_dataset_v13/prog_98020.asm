; DESCRIPTION: Draws a black rectangle at (303, 33) with width 117 and height 92.
; PLAN: r0=303(x), r1=33(y), r2=117(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 33
LDI r2, 117
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
