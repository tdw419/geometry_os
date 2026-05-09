; DESCRIPTION: Draws a yellow rectangle at (340, 136) with width 58 and height 80.
; PLAN: r0=340(x), r1=136(y), r2=58(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 136
LDI r2, 58
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
