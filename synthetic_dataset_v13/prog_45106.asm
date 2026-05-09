; DESCRIPTION: Draws a yellow rectangle at (187, 77) with width 104 and height 53.
; PLAN: r0=187(x), r1=77(y), r2=104(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 77
LDI r2, 104
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
