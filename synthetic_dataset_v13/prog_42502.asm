; DESCRIPTION: Draws a yellow rectangle at (401, 155) with width 106 and height 71.
; PLAN: r0=401(x), r1=155(y), r2=106(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 155
LDI r2, 106
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
