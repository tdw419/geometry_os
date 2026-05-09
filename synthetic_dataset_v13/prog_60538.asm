; DESCRIPTION: Places a white 13x47 rectangle at position (483, 64).
; PLAN: r0=483(x), r1=64(y), r2=13(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 64
LDI r2, 13
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
