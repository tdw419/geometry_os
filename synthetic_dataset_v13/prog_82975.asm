; DESCRIPTION: Places a purple 45x81 rectangle at position (110, 174).
; PLAN: r0=110(x), r1=174(y), r2=45(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 174
LDI r2, 45
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
