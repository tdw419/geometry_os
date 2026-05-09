; DESCRIPTION: Draws a orange rectangle at (415, 131) with width 79 and height 68.
; PLAN: r0=415(x), r1=131(y), r2=79(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 131
LDI r2, 79
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
