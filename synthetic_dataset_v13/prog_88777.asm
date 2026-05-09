; DESCRIPTION: Places a green 37x35 rectangle at position (291, 131).
; PLAN: r0=291(x), r1=131(y), r2=37(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 131
LDI r2, 37
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
