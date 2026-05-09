; DESCRIPTION: Draws a orange rectangle at (131, 95) with width 50 and height 87.
; PLAN: r0=131(x), r1=95(y), r2=50(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 95
LDI r2, 50
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
