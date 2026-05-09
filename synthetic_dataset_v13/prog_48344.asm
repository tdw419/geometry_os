; DESCRIPTION: Places a green 63x95 rectangle at position (325, 87).
; PLAN: r0=325(x), r1=87(y), r2=63(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 87
LDI r2, 63
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
