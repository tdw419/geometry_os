; DESCRIPTION: Places a blue 25x103 rectangle at position (323, 131).
; PLAN: r0=323(x), r1=131(y), r2=25(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 131
LDI r2, 25
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
