; DESCRIPTION: Draws a red rectangle at (273, 160) with width 50 and height 30.
; PLAN: r0=273(x), r1=160(y), r2=50(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 160
LDI r2, 50
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
