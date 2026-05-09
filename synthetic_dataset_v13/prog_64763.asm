; DESCRIPTION: Draws a green rectangle at (133, 45) with width 64 and height 107.
; PLAN: r0=133(x), r1=45(y), r2=64(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 45
LDI r2, 64
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
