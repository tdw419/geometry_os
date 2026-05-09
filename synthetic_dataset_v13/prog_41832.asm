; DESCRIPTION: Draws a yellow rectangle at (93, 5) with width 120 and height 85.
; PLAN: r0=93(x), r1=5(y), r2=120(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 5
LDI r2, 120
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
