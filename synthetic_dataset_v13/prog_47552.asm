; DESCRIPTION: Draws a yellow rectangle at (446, 23) with width 65 and height 106.
; PLAN: r0=446(x), r1=23(y), r2=65(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 23
LDI r2, 65
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
