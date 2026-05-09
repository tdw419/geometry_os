; DESCRIPTION: Places a blue 87x52 rectangle at position (323, 148).
; PLAN: r0=323(x), r1=148(y), r2=87(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 148
LDI r2, 87
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
