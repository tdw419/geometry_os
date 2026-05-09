; DESCRIPTION: Draws a orange rectangle at (311, 173) with width 103 and height 20.
; PLAN: r0=311(x), r1=173(y), r2=103(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 173
LDI r2, 103
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
