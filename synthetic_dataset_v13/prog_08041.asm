; DESCRIPTION: Draws a black rectangle at (302, 146) with width 104 and height 78.
; PLAN: r0=302(x), r1=146(y), r2=104(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 146
LDI r2, 104
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
