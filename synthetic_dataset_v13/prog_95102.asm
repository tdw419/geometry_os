; DESCRIPTION: Places a black 36x75 rectangle at position (429, 81).
; PLAN: r0=429(x), r1=81(y), r2=36(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 81
LDI r2, 36
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
