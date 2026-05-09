; DESCRIPTION: Draws a red rectangle at (9, 128) with width 107 and height 110.
; PLAN: r0=9(x), r1=128(y), r2=107(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 128
LDI r2, 107
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
