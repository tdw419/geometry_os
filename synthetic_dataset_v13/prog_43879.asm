; DESCRIPTION: Draws a orange rectangle at (87, 93) with width 87 and height 91.
; PLAN: r0=87(x), r1=93(y), r2=87(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 93
LDI r2, 87
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
