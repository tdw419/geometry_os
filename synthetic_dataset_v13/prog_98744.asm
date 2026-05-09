; DESCRIPTION: Draws a yellow rectangle at (391, 2) with width 104 and height 66.
; PLAN: r0=391(x), r1=2(y), r2=104(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 2
LDI r2, 104
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
