; DESCRIPTION: Draws a yellow rectangle at (61, 127) with width 79 and height 53.
; PLAN: r0=61(x), r1=127(y), r2=79(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 127
LDI r2, 79
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
