; DESCRIPTION: Draws a yellow rectangle at (193, 32) with width 46 and height 56.
; PLAN: r0=193(x), r1=32(y), r2=46(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 32
LDI r2, 46
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
