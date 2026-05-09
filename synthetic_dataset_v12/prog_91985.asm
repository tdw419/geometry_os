; DESCRIPTION: Places a cyan 10x72 rectangle at position (379, 77).
; PLAN: r0=379(x), r1=77(y), r2=10(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 77
LDI r2, 10
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
