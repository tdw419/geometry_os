; DESCRIPTION: Draws a orange rectangle at (109, 142) with width 103 and height 16.
; PLAN: r0=109(x), r1=142(y), r2=103(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 142
LDI r2, 103
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
