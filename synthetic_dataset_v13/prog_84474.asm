; DESCRIPTION: Draws a orange rectangle at (220, 87) with width 18 and height 120.
; PLAN: r0=220(x), r1=87(y), r2=18(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 87
LDI r2, 18
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
