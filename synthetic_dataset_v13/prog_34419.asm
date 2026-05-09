; DESCRIPTION: Draws a orange rectangle at (32, 103) with width 49 and height 66.
; PLAN: r0=32(x), r1=103(y), r2=49(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 103
LDI r2, 49
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
