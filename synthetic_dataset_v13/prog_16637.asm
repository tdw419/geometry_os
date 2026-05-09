; DESCRIPTION: Draws a yellow rectangle at (418, 103) with width 62 and height 44.
; PLAN: r0=418(x), r1=103(y), r2=62(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 103
LDI r2, 62
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
