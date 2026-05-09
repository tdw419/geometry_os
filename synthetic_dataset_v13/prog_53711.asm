; DESCRIPTION: Draws a red rectangle at (79, 105) with width 63 and height 32.
; PLAN: r0=79(x), r1=105(y), r2=63(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 105
LDI r2, 63
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
