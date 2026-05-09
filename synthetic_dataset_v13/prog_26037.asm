; DESCRIPTION: Draws a purple rectangle at (305, 44) with width 65 and height 50.
; PLAN: r0=305(x), r1=44(y), r2=65(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 44
LDI r2, 65
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
