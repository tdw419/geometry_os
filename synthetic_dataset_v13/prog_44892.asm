; DESCRIPTION: Draws a purple rectangle at (229, 154) with width 53 and height 77.
; PLAN: r0=229(x), r1=154(y), r2=53(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 154
LDI r2, 53
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
