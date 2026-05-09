; DESCRIPTION: Draws a yellow rectangle at (446, 104) with width 44 and height 74.
; PLAN: r0=446(x), r1=104(y), r2=44(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 104
LDI r2, 44
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
