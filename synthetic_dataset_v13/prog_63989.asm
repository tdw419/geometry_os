; DESCRIPTION: Draws a yellow rectangle at (46, 7) with width 110 and height 109.
; PLAN: r0=46(x), r1=7(y), r2=110(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 7
LDI r2, 110
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
