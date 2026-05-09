; DESCRIPTION: Places a purple 79x26 rectangle at position (358, 109).
; PLAN: r0=358(x), r1=109(y), r2=79(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 109
LDI r2, 79
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
