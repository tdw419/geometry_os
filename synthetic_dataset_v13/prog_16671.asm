; DESCRIPTION: Draws a white rectangle at (349, 3) with width 80 and height 32.
; PLAN: r0=349(x), r1=3(y), r2=80(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 3
LDI r2, 80
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
