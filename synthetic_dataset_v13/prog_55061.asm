; DESCRIPTION: Draws a red rectangle at (462, 30) with width 16 and height 85.
; PLAN: r0=462(x), r1=30(y), r2=16(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 30
LDI r2, 16
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
