; DESCRIPTION: Draws a green rectangle at (210, 37) with width 109 and height 23.
; PLAN: r0=210(x), r1=37(y), r2=109(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 37
LDI r2, 109
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
