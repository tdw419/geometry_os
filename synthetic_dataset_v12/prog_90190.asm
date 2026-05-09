; DESCRIPTION: Draws a red rectangle at (462, 22) with width 45 and height 109.
; PLAN: r0=462(x), r1=22(y), r2=45(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 22
LDI r2, 45
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
