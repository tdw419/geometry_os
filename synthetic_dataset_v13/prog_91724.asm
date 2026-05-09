; DESCRIPTION: Draws a blue rectangle at (305, 73) with width 94 and height 102.
; PLAN: r0=305(x), r1=73(y), r2=94(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 73
LDI r2, 94
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
