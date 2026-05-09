; DESCRIPTION: Draws a green rectangle at (373, 16) with width 55 and height 23.
; PLAN: r0=373(x), r1=16(y), r2=55(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 16
LDI r2, 55
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
