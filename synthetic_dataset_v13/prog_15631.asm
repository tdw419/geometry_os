; DESCRIPTION: Places a purple 22x12 rectangle at position (434, 96).
; PLAN: r0=434(x), r1=96(y), r2=22(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 96
LDI r2, 22
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
