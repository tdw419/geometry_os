; DESCRIPTION: Draws a orange rectangle at (335, 106) with width 65 and height 32.
; PLAN: r0=335(x), r1=106(y), r2=65(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 106
LDI r2, 65
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
