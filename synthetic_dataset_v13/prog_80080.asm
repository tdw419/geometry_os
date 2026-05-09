; DESCRIPTION: Places a blue 32x49 rectangle at position (361, 112).
; PLAN: r0=361(x), r1=112(y), r2=32(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 112
LDI r2, 32
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
