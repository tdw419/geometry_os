; DESCRIPTION: Places a blue 53x61 rectangle at position (213, 89).
; PLAN: r0=213(x), r1=89(y), r2=53(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 89
LDI r2, 53
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
