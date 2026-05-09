; DESCRIPTION: Draws a green rectangle at (237, 62) with width 12 and height 98.
; PLAN: r0=237(x), r1=62(y), r2=12(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 62
LDI r2, 12
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
