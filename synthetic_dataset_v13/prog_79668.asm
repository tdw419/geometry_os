; DESCRIPTION: Draws a yellow rectangle at (362, 150) with width 32 and height 55.
; PLAN: r0=362(x), r1=150(y), r2=32(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 150
LDI r2, 32
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
