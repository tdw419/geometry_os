; DESCRIPTION: Draws a green rectangle at (285, 218) with width 28 and height 32.
; PLAN: r0=285(x), r1=218(y), r2=28(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 218
LDI r2, 28
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
