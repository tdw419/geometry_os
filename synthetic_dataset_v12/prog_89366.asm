; DESCRIPTION: Draws a yellow rectangle at (285, 63) with width 117 and height 16.
; PLAN: r0=285(x), r1=63(y), r2=117(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 63
LDI r2, 117
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
