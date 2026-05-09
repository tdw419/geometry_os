; DESCRIPTION: Places a magenta 77x10 rectangle at position (363, 89).
; PLAN: r0=363(x), r1=89(y), r2=77(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 89
LDI r2, 77
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
