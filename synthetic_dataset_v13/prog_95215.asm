; DESCRIPTION: Places a blue 64x31 rectangle at position (365, 195).
; PLAN: r0=365(x), r1=195(y), r2=64(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 195
LDI r2, 64
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
