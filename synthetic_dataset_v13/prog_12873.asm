; DESCRIPTION: Places a blue 95x120 rectangle at position (131, 85).
; PLAN: r0=131(x), r1=85(y), r2=95(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 85
LDI r2, 95
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
