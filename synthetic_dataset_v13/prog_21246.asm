; DESCRIPTION: Draws a white rectangle at (255, 51) with width 65 and height 64.
; PLAN: r0=255(x), r1=51(y), r2=65(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 51
LDI r2, 65
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
