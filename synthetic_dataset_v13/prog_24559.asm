; DESCRIPTION: Draws a white rectangle at (392, 100) with width 10 and height 43.
; PLAN: r0=392(x), r1=100(y), r2=10(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 100
LDI r2, 10
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
