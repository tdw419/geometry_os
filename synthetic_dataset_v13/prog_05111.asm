; DESCRIPTION: Places a magenta 13x21 rectangle at position (477, 120).
; PLAN: r0=477(x), r1=120(y), r2=13(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 120
LDI r2, 13
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
