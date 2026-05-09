; DESCRIPTION: Draws a blue rectangle at (305, 73) with width 65 and height 38.
; PLAN: r0=305(x), r1=73(y), r2=65(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 73
LDI r2, 65
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
