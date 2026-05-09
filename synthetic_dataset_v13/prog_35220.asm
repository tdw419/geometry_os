; DESCRIPTION: Places a blue 110x47 rectangle at position (278, 155).
; PLAN: r0=278(x), r1=155(y), r2=110(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 155
LDI r2, 110
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
