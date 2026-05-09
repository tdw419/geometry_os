; DESCRIPTION: Draws a orange rectangle at (263, 10) with width 94 and height 105.
; PLAN: r0=263(x), r1=10(y), r2=94(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 10
LDI r2, 94
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
