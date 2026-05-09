; DESCRIPTION: Draws a yellow rectangle at (271, 222) with width 61 and height 21.
; PLAN: r0=271(x), r1=222(y), r2=61(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 222
LDI r2, 61
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
