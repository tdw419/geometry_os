; DESCRIPTION: Places a magenta 66x89 rectangle at position (367, 19).
; PLAN: r0=367(x), r1=19(y), r2=66(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 19
LDI r2, 66
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
