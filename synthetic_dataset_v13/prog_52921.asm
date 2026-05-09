; DESCRIPTION: Draws a yellow rectangle at (259, 152) with width 51 and height 94.
; PLAN: r0=259(x), r1=152(y), r2=51(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 152
LDI r2, 51
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
