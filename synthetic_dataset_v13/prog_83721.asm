; DESCRIPTION: Draws a blue rectangle at (392, 189) with width 66 and height 56.
; PLAN: r0=392(x), r1=189(y), r2=66(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 189
LDI r2, 66
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
