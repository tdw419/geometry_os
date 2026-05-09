; DESCRIPTION: Draws a blue rectangle at (429, 132) with width 21 and height 44.
; PLAN: r0=429(x), r1=132(y), r2=21(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 132
LDI r2, 21
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
