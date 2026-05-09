; DESCRIPTION: Draws a yellow rectangle at (243, 109) with width 51 and height 44.
; PLAN: r0=243(x), r1=109(y), r2=51(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 109
LDI r2, 51
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
