; DESCRIPTION: Places a black 56x56 rectangle at position (338, 145).
; PLAN: r0=338(x), r1=145(y), r2=56(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 145
LDI r2, 56
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
