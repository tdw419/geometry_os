; DESCRIPTION: Draws a yellow rectangle at (195, 58) with width 39 and height 36.
; PLAN: r0=195(x), r1=58(y), r2=39(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 58
LDI r2, 39
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
