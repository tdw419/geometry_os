; DESCRIPTION: Places a purple 22x30 rectangle at position (200, 179).
; PLAN: r0=200(x), r1=179(y), r2=22(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 179
LDI r2, 22
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
