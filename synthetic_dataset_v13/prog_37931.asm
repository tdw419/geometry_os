; DESCRIPTION: Draws a yellow rectangle at (263, 35) with width 94 and height 48.
; PLAN: r0=263(x), r1=35(y), r2=94(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 35
LDI r2, 94
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
