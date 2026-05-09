; DESCRIPTION: Draws a purple rectangle at (154, 131) with width 18 and height 91.
; PLAN: r0=154(x), r1=131(y), r2=18(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 131
LDI r2, 18
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
