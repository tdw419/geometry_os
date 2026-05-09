; DESCRIPTION: Draws a yellow rectangle at (417, 136) with width 86 and height 85.
; PLAN: r0=417(x), r1=136(y), r2=86(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 136
LDI r2, 86
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
