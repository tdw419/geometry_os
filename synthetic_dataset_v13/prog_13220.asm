; DESCRIPTION: Draws a orange rectangle at (398, 153) with width 62 and height 60.
; PLAN: r0=398(x), r1=153(y), r2=62(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 153
LDI r2, 62
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
