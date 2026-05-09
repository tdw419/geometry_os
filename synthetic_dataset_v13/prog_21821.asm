; DESCRIPTION: Draws a orange rectangle at (185, 9) with width 64 and height 70.
; PLAN: r0=185(x), r1=9(y), r2=64(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 9
LDI r2, 64
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
