; DESCRIPTION: Draws a green rectangle at (68, 128) with width 77 and height 107.
; PLAN: r0=68(x), r1=128(y), r2=77(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 128
LDI r2, 77
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
