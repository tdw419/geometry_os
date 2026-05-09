; DESCRIPTION: Draws a yellow rectangle at (331, 164) with width 85 and height 23.
; PLAN: r0=331(x), r1=164(y), r2=85(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 164
LDI r2, 85
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
