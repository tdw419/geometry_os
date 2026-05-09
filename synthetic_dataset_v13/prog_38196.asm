; DESCRIPTION: Draws a yellow rectangle at (91, 188) with width 109 and height 27.
; PLAN: r0=91(x), r1=188(y), r2=109(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 188
LDI r2, 109
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
