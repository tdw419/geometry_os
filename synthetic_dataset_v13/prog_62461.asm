; DESCRIPTION: Draws a yellow rectangle at (356, 144) with width 21 and height 17.
; PLAN: r0=356(x), r1=144(y), r2=21(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 144
LDI r2, 21
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
