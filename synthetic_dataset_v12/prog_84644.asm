; DESCRIPTION: Draws a yellow rectangle at (418, 87) with width 50 and height 101.
; PLAN: r0=418(x), r1=87(y), r2=50(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 87
LDI r2, 50
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
