; DESCRIPTION: Draws a white rectangle at (418, 199) with width 94 and height 32.
; PLAN: r0=418(x), r1=199(y), r2=94(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 199
LDI r2, 94
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
