; DESCRIPTION: Draws a red rectangle at (314, 204) with width 68 and height 51.
; PLAN: r0=314(x), r1=204(y), r2=68(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 204
LDI r2, 68
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
