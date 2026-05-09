; DESCRIPTION: Draws a yellow rectangle at (408, 127) with width 93 and height 16.
; PLAN: r0=408(x), r1=127(y), r2=93(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 127
LDI r2, 93
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
