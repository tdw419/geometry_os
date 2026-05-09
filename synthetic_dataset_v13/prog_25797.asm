; DESCRIPTION: Draws a yellow rectangle at (319, 152) with width 79 and height 74.
; PLAN: r0=319(x), r1=152(y), r2=79(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 152
LDI r2, 79
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
