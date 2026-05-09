; DESCRIPTION: Draws a white rectangle at (389, 64) with width 79 and height 32.
; PLAN: r0=389(x), r1=64(y), r2=79(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 64
LDI r2, 79
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
