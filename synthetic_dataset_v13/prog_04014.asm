; DESCRIPTION: Draws a yellow rectangle at (56, 58) with width 30 and height 27.
; PLAN: r0=56(x), r1=58(y), r2=30(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 58
LDI r2, 30
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
