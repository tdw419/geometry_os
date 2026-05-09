; DESCRIPTION: Draws a yellow rectangle at (47, 171) with width 45 and height 18.
; PLAN: r0=47(x), r1=171(y), r2=45(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 171
LDI r2, 45
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
