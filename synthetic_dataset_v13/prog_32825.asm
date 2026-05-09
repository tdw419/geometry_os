; DESCRIPTION: Draws a yellow rectangle at (124, 133) with width 45 and height 109.
; PLAN: r0=124(x), r1=133(y), r2=45(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 133
LDI r2, 45
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
