; DESCRIPTION: Draws a yellow rectangle at (340, 7) with width 104 and height 114.
; PLAN: r0=340(x), r1=7(y), r2=104(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 7
LDI r2, 104
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
