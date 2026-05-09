; DESCRIPTION: Places a blue 110x106 rectangle at position (45, 79).
; PLAN: r0=45(x), r1=79(y), r2=110(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 79
LDI r2, 110
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
