; DESCRIPTION: Draws a blue rectangle at (152, 51) with width 117 and height 99.
; PLAN: r0=152(x), r1=51(y), r2=117(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 51
LDI r2, 117
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
