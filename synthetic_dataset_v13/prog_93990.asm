; DESCRIPTION: Places a green 109x105 rectangle at position (356, 63).
; PLAN: r0=356(x), r1=63(y), r2=109(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 63
LDI r2, 109
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
