; DESCRIPTION: Places a cyan 119x81 rectangle at position (379, 142).
; PLAN: r0=379(x), r1=142(y), r2=119(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 142
LDI r2, 119
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
