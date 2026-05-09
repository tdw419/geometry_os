; DESCRIPTION: Places a magenta 84x52 rectangle at position (83, 204).
; PLAN: r0=83(x), r1=204(y), r2=84(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 204
LDI r2, 84
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
