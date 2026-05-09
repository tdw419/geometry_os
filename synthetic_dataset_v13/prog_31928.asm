; DESCRIPTION: Places a purple 83x30 rectangle at position (3, 161).
; PLAN: r0=3(x), r1=161(y), r2=83(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 161
LDI r2, 83
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
