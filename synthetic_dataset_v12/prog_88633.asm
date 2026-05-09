; DESCRIPTION: Draws a purple rectangle at (401, 165) with width 22 and height 77.
; PLAN: r0=401(x), r1=165(y), r2=22(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 165
LDI r2, 22
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
