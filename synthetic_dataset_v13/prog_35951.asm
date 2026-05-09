; DESCRIPTION: Places a magenta 60x30 rectangle at position (363, 99).
; PLAN: r0=363(x), r1=99(y), r2=60(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 99
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
