; DESCRIPTION: Places a white 60x16 rectangle at position (379, 212).
; PLAN: r0=379(x), r1=212(y), r2=60(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 212
LDI r2, 60
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
