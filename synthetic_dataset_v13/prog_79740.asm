; DESCRIPTION: Draws a green rectangle at (32, 127) with width 46 and height 96.
; PLAN: r0=32(x), r1=127(y), r2=46(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 127
LDI r2, 46
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
