; DESCRIPTION: Draws a blue rectangle at (431, 71) with width 48 and height 117.
; PLAN: r0=431(x), r1=71(y), r2=48(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 71
LDI r2, 48
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
