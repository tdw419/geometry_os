; DESCRIPTION: Places a cyan 31x103 rectangle at position (56, 90).
; PLAN: r0=56(x), r1=90(y), r2=31(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 90
LDI r2, 31
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
