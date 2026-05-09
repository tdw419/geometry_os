; DESCRIPTION: Draws a red rectangle at (250, 193) with width 85 and height 12.
; PLAN: r0=250(x), r1=193(y), r2=85(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 193
LDI r2, 85
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
