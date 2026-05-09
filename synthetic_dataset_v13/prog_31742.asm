; DESCRIPTION: Places a blue 21x66 rectangle at position (358, 45).
; PLAN: r0=358(x), r1=45(y), r2=21(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 45
LDI r2, 21
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
