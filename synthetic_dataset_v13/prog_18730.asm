; DESCRIPTION: Places a cyan 116x90 rectangle at position (201, 5).
; PLAN: r0=201(x), r1=5(y), r2=116(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 5
LDI r2, 116
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
