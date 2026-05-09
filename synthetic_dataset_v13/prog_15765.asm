; DESCRIPTION: Draws a green rectangle at (394, 218) with width 34 and height 22.
; PLAN: r0=394(x), r1=218(y), r2=34(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 218
LDI r2, 34
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
