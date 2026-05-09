; DESCRIPTION: Places a black 60x22 rectangle at position (338, 75).
; PLAN: r0=338(x), r1=75(y), r2=60(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 75
LDI r2, 60
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
