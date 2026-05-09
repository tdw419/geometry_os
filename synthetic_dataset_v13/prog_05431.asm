; DESCRIPTION: Draws a yellow rectangle at (27, 174) with width 66 and height 50.
; PLAN: r0=27(x), r1=174(y), r2=66(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 174
LDI r2, 66
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
