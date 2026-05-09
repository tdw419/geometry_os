; DESCRIPTION: Places a magenta 21x89 rectangle at position (308, 10).
; PLAN: r0=308(x), r1=10(y), r2=21(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 10
LDI r2, 21
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
