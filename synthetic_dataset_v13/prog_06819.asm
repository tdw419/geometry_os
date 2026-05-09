; DESCRIPTION: Draws a purple rectangle at (65, 146) with width 58 and height 77.
; PLAN: r0=65(x), r1=146(y), r2=58(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 146
LDI r2, 58
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
