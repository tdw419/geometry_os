; DESCRIPTION: Draws a orange rectangle at (411, 119) with width 72 and height 65.
; PLAN: r0=411(x), r1=119(y), r2=72(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 119
LDI r2, 72
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
