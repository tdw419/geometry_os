; DESCRIPTION: Draws a yellow rectangle at (305, 99) with width 96 and height 79.
; PLAN: r0=305(x), r1=99(y), r2=96(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 99
LDI r2, 96
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
