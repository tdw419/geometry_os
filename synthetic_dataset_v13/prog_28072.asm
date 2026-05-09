; DESCRIPTION: Draws a yellow rectangle at (18, 87) with width 120 and height 46.
; PLAN: r0=18(x), r1=87(y), r2=120(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 87
LDI r2, 120
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
