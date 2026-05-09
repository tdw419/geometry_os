; DESCRIPTION: Draws a red rectangle at (50, 36) with width 80 and height 30.
; PLAN: r0=50(x), r1=36(y), r2=80(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 36
LDI r2, 80
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
