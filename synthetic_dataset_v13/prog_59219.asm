; DESCRIPTION: Draws a green rectangle at (229, 101) with width 48 and height 57.
; PLAN: r0=229(x), r1=101(y), r2=48(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 101
LDI r2, 48
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
