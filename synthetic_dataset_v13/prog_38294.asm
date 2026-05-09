; DESCRIPTION: Places a red 63x89 rectangle at position (381, 57).
; PLAN: r0=381(x), r1=57(y), r2=63(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 57
LDI r2, 63
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
