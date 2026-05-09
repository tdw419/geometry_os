; DESCRIPTION: Draws a yellow rectangle at (83, 160) with width 44 and height 45.
; PLAN: r0=83(x), r1=160(y), r2=44(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 160
LDI r2, 44
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
