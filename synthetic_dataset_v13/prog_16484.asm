; DESCRIPTION: Places a purple 96x12 rectangle at position (96, 109).
; PLAN: r0=96(x), r1=109(y), r2=96(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 109
LDI r2, 96
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
