; DESCRIPTION: Draws a black rectangle at (420, 127) with width 16 and height 100.
; PLAN: r0=420(x), r1=127(y), r2=16(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 127
LDI r2, 16
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
