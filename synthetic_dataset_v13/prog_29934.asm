; DESCRIPTION: Places a purple 32x55 rectangle at position (344, 142).
; PLAN: r0=344(x), r1=142(y), r2=32(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 142
LDI r2, 32
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
