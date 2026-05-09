; DESCRIPTION: Places a black 21x120 rectangle at position (337, 131).
; PLAN: r0=337(x), r1=131(y), r2=21(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 131
LDI r2, 21
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
