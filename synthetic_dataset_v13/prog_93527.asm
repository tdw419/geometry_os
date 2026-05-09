; DESCRIPTION: Places a blue 98x20 rectangle at position (325, 61).
; PLAN: r0=325(x), r1=61(y), r2=98(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 61
LDI r2, 98
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
