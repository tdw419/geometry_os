; DESCRIPTION: Draws a yellow rectangle at (176, 49) with width 44 and height 79.
; PLAN: r0=176(x), r1=49(y), r2=44(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 49
LDI r2, 44
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
