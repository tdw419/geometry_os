; DESCRIPTION: Draws a yellow rectangle at (290, 176) with width 11 and height 58.
; PLAN: r0=290(x), r1=176(y), r2=11(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 176
LDI r2, 11
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
