; DESCRIPTION: Places a blue 79x64 rectangle at position (336, 87).
; PLAN: r0=336(x), r1=87(y), r2=79(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 87
LDI r2, 79
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
