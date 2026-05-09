; DESCRIPTION: Draws a yellow rectangle at (57, 120) with width 57 and height 85.
; PLAN: r0=57(x), r1=120(y), r2=57(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 120
LDI r2, 57
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
