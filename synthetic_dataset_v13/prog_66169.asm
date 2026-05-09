; DESCRIPTION: Places a cyan 87x96 rectangle at position (250, 115).
; PLAN: r0=250(x), r1=115(y), r2=87(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 115
LDI r2, 87
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
