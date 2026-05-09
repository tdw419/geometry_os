; DESCRIPTION: Draws a black rectangle at (106, 103) with width 104 and height 50.
; PLAN: r0=106(x), r1=103(y), r2=104(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 103
LDI r2, 104
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
