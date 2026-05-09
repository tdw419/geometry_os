; DESCRIPTION: Draws a red rectangle at (357, 80) with width 111 and height 58.
; PLAN: r0=357(x), r1=80(y), r2=111(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 80
LDI r2, 111
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
