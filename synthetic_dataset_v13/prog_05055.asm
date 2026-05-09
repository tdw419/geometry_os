; DESCRIPTION: Draws a purple rectangle at (42, 146) with width 109 and height 36.
; PLAN: r0=42(x), r1=146(y), r2=109(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 146
LDI r2, 109
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
