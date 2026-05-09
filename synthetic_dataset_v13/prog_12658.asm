; DESCRIPTION: Draws a orange rectangle at (398, 90) with width 101 and height 98.
; PLAN: r0=398(x), r1=90(y), r2=101(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 90
LDI r2, 101
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
