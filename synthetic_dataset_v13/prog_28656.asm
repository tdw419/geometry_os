; DESCRIPTION: Draws a purple rectangle at (398, 65) with width 14 and height 34.
; PLAN: r0=398(x), r1=65(y), r2=14(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 65
LDI r2, 14
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
