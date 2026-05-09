; DESCRIPTION: Draws a white rectangle at (308, 8) with width 32 and height 19.
; PLAN: r0=308(x), r1=8(y), r2=32(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 8
LDI r2, 32
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
