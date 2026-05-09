; DESCRIPTION: Draws a yellow rectangle at (411, 127) with width 16 and height 51.
; PLAN: r0=411(x), r1=127(y), r2=16(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 127
LDI r2, 16
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
