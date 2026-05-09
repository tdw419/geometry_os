; DESCRIPTION: Places a blue 61x10 rectangle at position (314, 185).
; PLAN: r0=314(x), r1=185(y), r2=61(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 185
LDI r2, 61
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
