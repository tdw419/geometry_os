; DESCRIPTION: Draws a black rectangle at (368, 127) with width 36 and height 59.
; PLAN: r0=368(x), r1=127(y), r2=36(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 127
LDI r2, 36
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
