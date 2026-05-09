; DESCRIPTION: Places a purple 66x50 rectangle at position (442, 142).
; PLAN: r0=442(x), r1=142(y), r2=66(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 142
LDI r2, 66
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
