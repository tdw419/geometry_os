; DESCRIPTION: Places a purple 79x109 rectangle at position (361, 24).
; PLAN: r0=361(x), r1=24(y), r2=79(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 24
LDI r2, 79
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
