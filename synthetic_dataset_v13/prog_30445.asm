; DESCRIPTION: Places a purple 106x104 rectangle at position (120, 131).
; PLAN: r0=120(x), r1=131(y), r2=106(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 131
LDI r2, 106
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
