; DESCRIPTION: Draws a orange rectangle at (412, 104) with width 95 and height 60.
; PLAN: r0=412(x), r1=104(y), r2=95(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 104
LDI r2, 95
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
