; DESCRIPTION: Draws a orange rectangle at (3, 180) with width 103 and height 13.
; PLAN: r0=3(x), r1=180(y), r2=103(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 180
LDI r2, 103
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
