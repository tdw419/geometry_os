; DESCRIPTION: Draws a orange rectangle at (309, 150) with width 45 and height 89.
; PLAN: r0=309(x), r1=150(y), r2=45(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 150
LDI r2, 45
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
