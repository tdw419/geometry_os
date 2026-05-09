; DESCRIPTION: Draws a red rectangle at (201, 161) with width 38 and height 47.
; PLAN: r0=201(x), r1=161(y), r2=38(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 161
LDI r2, 38
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
