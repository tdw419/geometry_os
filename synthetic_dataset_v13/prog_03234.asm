; DESCRIPTION: Draws a orange rectangle at (450, 65) with width 31 and height 48.
; PLAN: r0=450(x), r1=65(y), r2=31(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 65
LDI r2, 31
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
