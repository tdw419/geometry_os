; DESCRIPTION: Places a purple 77x79 rectangle at position (256, 156).
; PLAN: r0=256(x), r1=156(y), r2=77(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 156
LDI r2, 77
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
