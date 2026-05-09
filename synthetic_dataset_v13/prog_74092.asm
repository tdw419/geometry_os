; DESCRIPTION: Places a blue 79x103 rectangle at position (110, 49).
; PLAN: r0=110(x), r1=49(y), r2=79(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 49
LDI r2, 79
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
