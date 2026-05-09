; DESCRIPTION: Places a blue 112x53 rectangle at position (361, 79).
; PLAN: r0=361(x), r1=79(y), r2=112(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 79
LDI r2, 112
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
