; DESCRIPTION: Places a purple 75x32 rectangle at position (177, 100).
; PLAN: r0=177(x), r1=100(y), r2=75(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 100
LDI r2, 75
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
