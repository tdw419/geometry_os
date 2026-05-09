; DESCRIPTION: Draws a purple rectangle at (346, 68) with width 73 and height 59.
; PLAN: r0=346(x), r1=68(y), r2=73(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 68
LDI r2, 73
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
