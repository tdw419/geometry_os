; DESCRIPTION: Draws a red rectangle at (351, 52) with width 44 and height 32.
; PLAN: r0=351(x), r1=52(y), r2=44(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 52
LDI r2, 44
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
