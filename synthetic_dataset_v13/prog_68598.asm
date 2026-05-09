; DESCRIPTION: Draws a yellow rectangle at (233, 14) with width 104 and height 120.
; PLAN: r0=233(x), r1=14(y), r2=104(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 14
LDI r2, 104
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
