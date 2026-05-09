; DESCRIPTION: Draws a green rectangle at (253, 37) with width 87 and height 21.
; PLAN: r0=253(x), r1=37(y), r2=87(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 37
LDI r2, 87
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
