; DESCRIPTION: Draws a yellow rectangle at (211, 40) with width 16 and height 80.
; PLAN: r0=211(x), r1=40(y), r2=16(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 40
LDI r2, 16
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
