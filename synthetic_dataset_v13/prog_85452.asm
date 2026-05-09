; DESCRIPTION: Draws a black rectangle at (447, 15) with width 40 and height 120.
; PLAN: r0=447(x), r1=15(y), r2=40(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 15
LDI r2, 40
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
