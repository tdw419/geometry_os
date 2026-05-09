; DESCRIPTION: Draws a yellow rectangle at (90, 127) with width 48 and height 15.
; PLAN: r0=90(x), r1=127(y), r2=48(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 127
LDI r2, 48
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
