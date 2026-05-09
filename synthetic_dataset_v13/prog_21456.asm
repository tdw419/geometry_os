; DESCRIPTION: Draws a green rectangle at (260, 46) with width 92 and height 11.
; PLAN: r0=260(x), r1=46(y), r2=92(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 46
LDI r2, 92
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
