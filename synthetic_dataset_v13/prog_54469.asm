; DESCRIPTION: Draws a yellow rectangle at (226, 85) with width 99 and height 21.
; PLAN: r0=226(x), r1=85(y), r2=99(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 85
LDI r2, 99
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
