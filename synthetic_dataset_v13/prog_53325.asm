; DESCRIPTION: Draws a yellow rectangle at (10, 163) with width 47 and height 65.
; PLAN: r0=10(x), r1=163(y), r2=47(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 163
LDI r2, 47
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
