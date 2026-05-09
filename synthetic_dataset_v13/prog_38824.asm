; DESCRIPTION: Places a purple 105x105 rectangle at position (308, 7).
; PLAN: r0=308(x), r1=7(y), r2=105(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 7
LDI r2, 105
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
