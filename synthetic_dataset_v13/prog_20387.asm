; DESCRIPTION: Draws a blue rectangle at (277, 162) with width 94 and height 27.
; PLAN: r0=277(x), r1=162(y), r2=94(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 162
LDI r2, 94
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
