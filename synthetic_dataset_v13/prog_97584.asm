; DESCRIPTION: Draws a green rectangle at (447, 202) with width 33 and height 30.
; PLAN: r0=447(x), r1=202(y), r2=33(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 202
LDI r2, 33
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
