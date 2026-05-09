; DESCRIPTION: Draws a black rectangle at (135, 177) with width 21 and height 79.
; PLAN: r0=135(x), r1=177(y), r2=21(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 177
LDI r2, 21
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
