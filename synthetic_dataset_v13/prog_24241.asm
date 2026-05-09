; DESCRIPTION: Draws a yellow rectangle at (48, 14) with width 104 and height 48.
; PLAN: r0=48(x), r1=14(y), r2=104(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 14
LDI r2, 104
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
