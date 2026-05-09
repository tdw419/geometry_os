; DESCRIPTION: Draws a red rectangle at (448, 220) with width 31 and height 32.
; PLAN: r0=448(x), r1=220(y), r2=31(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 220
LDI r2, 31
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
