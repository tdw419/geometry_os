; DESCRIPTION: Draws a yellow rectangle at (272, 102) with width 79 and height 16.
; PLAN: r0=272(x), r1=102(y), r2=79(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 102
LDI r2, 79
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
