; DESCRIPTION: Draws a purple rectangle at (55, 47) with width 18 and height 42.
; PLAN: r0=55(x), r1=47(y), r2=18(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 47
LDI r2, 18
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
