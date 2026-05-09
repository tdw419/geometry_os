; DESCRIPTION: Draws a yellow rectangle at (209, 36) with width 79 and height 21.
; PLAN: r0=209(x), r1=36(y), r2=79(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 36
LDI r2, 79
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
