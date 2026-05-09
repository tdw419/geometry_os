; DESCRIPTION: Draws a yellow rectangle at (398, 22) with width 79 and height 18.
; PLAN: r0=398(x), r1=22(y), r2=79(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 22
LDI r2, 79
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
