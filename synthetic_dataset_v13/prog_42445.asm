; DESCRIPTION: Draws a orange rectangle at (335, 44) with width 10 and height 82.
; PLAN: r0=335(x), r1=44(y), r2=10(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 44
LDI r2, 10
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
