; DESCRIPTION: Draws a red rectangle at (357, 109) with width 20 and height 48.
; PLAN: r0=357(x), r1=109(y), r2=20(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 109
LDI r2, 20
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
