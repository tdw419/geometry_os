; DESCRIPTION: Places a white 10x40 rectangle at position (231, 131).
; PLAN: r0=231(x), r1=131(y), r2=10(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 131
LDI r2, 10
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
