; DESCRIPTION: Draws a white rectangle at (428, 32) with width 64 and height 15.
; PLAN: r0=428(x), r1=32(y), r2=64(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 32
LDI r2, 64
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
