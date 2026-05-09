; DESCRIPTION: Draws a blue rectangle at (308, 26) with width 45 and height 87.
; PLAN: r0=308(x), r1=26(y), r2=45(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 26
LDI r2, 45
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
