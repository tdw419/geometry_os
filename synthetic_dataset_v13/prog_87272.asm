; DESCRIPTION: Places a purple 90x55 rectangle at position (219, 86).
; PLAN: r0=219(x), r1=86(y), r2=90(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 86
LDI r2, 90
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
