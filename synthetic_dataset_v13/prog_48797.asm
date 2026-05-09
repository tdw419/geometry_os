; DESCRIPTION: Places a purple 59x22 rectangle at position (439, 110).
; PLAN: r0=439(x), r1=110(y), r2=59(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 110
LDI r2, 59
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
