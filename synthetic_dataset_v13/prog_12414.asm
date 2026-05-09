; DESCRIPTION: Draws a yellow rectangle at (195, 214) with width 23 and height 12.
; PLAN: r0=195(x), r1=214(y), r2=23(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 214
LDI r2, 23
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
