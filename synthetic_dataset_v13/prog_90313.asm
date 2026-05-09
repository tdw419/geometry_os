; DESCRIPTION: Draws a yellow rectangle at (285, 178) with width 86 and height 34.
; PLAN: r0=285(x), r1=178(y), r2=86(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 178
LDI r2, 86
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
