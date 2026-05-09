; DESCRIPTION: Places a blue 85x55 rectangle at position (390, 46).
; PLAN: r0=390(x), r1=46(y), r2=85(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 46
LDI r2, 85
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
