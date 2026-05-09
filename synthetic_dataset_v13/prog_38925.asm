; DESCRIPTION: Draws a red rectangle at (50, 80) with width 13 and height 92.
; PLAN: r0=50(x), r1=80(y), r2=13(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 80
LDI r2, 13
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
