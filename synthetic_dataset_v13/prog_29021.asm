; DESCRIPTION: Draws a yellow rectangle at (489, 152) with width 18 and height 99.
; PLAN: r0=489(x), r1=152(y), r2=18(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 152
LDI r2, 18
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
