; DESCRIPTION: Places a cyan 87x92 rectangle at position (282, 60).
; PLAN: r0=282(x), r1=60(y), r2=87(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 60
LDI r2, 87
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
