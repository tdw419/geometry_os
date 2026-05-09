; DESCRIPTION: Draws a red rectangle at (29, 145) with width 79 and height 86.
; PLAN: r0=29(x), r1=145(y), r2=79(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 145
LDI r2, 79
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
