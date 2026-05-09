; DESCRIPTION: Places a white 11x48 rectangle at position (483, 87).
; PLAN: r0=483(x), r1=87(y), r2=11(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 87
LDI r2, 11
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
