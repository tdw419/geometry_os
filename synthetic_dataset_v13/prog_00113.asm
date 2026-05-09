; DESCRIPTION: Draws a orange rectangle at (80, 45) with width 12 and height 90.
; PLAN: r0=80(x), r1=45(y), r2=12(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 45
LDI r2, 12
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
