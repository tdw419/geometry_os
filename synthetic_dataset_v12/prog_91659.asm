; DESCRIPTION: Draws a black rectangle at (46, 150) with width 22 and height 65.
; PLAN: r0=46(x), r1=150(y), r2=22(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 150
LDI r2, 22
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
