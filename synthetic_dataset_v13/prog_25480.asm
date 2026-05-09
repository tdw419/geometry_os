; DESCRIPTION: Draws a green rectangle at (94, 173) with width 51 and height 31.
; PLAN: r0=94(x), r1=173(y), r2=51(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 173
LDI r2, 51
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
