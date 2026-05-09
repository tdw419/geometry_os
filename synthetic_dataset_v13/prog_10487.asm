; DESCRIPTION: Draws a purple rectangle at (398, 68) with width 57 and height 63.
; PLAN: r0=398(x), r1=68(y), r2=57(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 68
LDI r2, 57
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
