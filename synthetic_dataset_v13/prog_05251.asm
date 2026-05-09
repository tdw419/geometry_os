; DESCRIPTION: Draws a yellow rectangle at (419, 13) with width 65 and height 54.
; PLAN: r0=419(x), r1=13(y), r2=65(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 13
LDI r2, 65
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
