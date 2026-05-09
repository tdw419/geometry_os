; DESCRIPTION: Draws a blue rectangle at (243, 169) with width 52 and height 13.
; PLAN: r0=243(x), r1=169(y), r2=52(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 169
LDI r2, 52
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
