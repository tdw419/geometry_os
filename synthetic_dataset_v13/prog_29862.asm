; DESCRIPTION: Draws a orange rectangle at (94, 87) with width 73 and height 32.
; PLAN: r0=94(x), r1=87(y), r2=73(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 87
LDI r2, 73
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
