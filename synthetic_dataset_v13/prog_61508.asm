; DESCRIPTION: Draws a red rectangle at (56, 145) with width 48 and height 80.
; PLAN: r0=56(x), r1=145(y), r2=48(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 145
LDI r2, 48
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
