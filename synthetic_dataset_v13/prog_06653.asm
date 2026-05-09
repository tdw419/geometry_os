; DESCRIPTION: Draws a orange rectangle at (250, 191) with width 14 and height 44.
; PLAN: r0=250(x), r1=191(y), r2=14(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 191
LDI r2, 14
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
