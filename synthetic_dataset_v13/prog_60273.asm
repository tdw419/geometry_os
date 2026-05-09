; DESCRIPTION: Draws a yellow rectangle at (465, 100) with width 46 and height 16.
; PLAN: r0=465(x), r1=100(y), r2=46(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 100
LDI r2, 46
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
