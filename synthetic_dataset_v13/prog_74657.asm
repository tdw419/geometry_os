; DESCRIPTION: Draws a orange rectangle at (342, 16) with width 80 and height 60.
; PLAN: r0=342(x), r1=16(y), r2=80(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 16
LDI r2, 80
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
