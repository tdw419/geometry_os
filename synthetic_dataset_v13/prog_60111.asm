; DESCRIPTION: Draws a red rectangle at (347, 132) with width 16 and height 30.
; PLAN: r0=347(x), r1=132(y), r2=16(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 132
LDI r2, 16
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
