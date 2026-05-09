; DESCRIPTION: Draws a yellow rectangle at (187, 18) with width 87 and height 66.
; PLAN: r0=187(x), r1=18(y), r2=87(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 18
LDI r2, 87
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
