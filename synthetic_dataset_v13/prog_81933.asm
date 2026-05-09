; DESCRIPTION: Draws a yellow rectangle at (392, 11) with width 20 and height 102.
; PLAN: r0=392(x), r1=11(y), r2=20(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 11
LDI r2, 20
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
