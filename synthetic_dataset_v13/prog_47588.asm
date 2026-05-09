; DESCRIPTION: Draws a yellow rectangle at (1, 117) with width 47 and height 87.
; PLAN: r0=1(x), r1=117(y), r2=47(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 117
LDI r2, 47
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
