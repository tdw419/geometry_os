; DESCRIPTION: Draws a black rectangle at (165, 218) with width 18 and height 24.
; PLAN: r0=165(x), r1=218(y), r2=18(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 218
LDI r2, 18
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
