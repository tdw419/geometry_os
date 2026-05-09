; DESCRIPTION: Draws a red rectangle at (402, 149) with width 11 and height 47.
; PLAN: r0=402(x), r1=149(y), r2=11(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 149
LDI r2, 11
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
