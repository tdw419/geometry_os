; DESCRIPTION: Draws a orange rectangle at (367, 115) with width 64 and height 20.
; PLAN: r0=367(x), r1=115(y), r2=64(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 115
LDI r2, 64
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
