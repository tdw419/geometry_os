; DESCRIPTION: Places a blue 62x48 rectangle at position (61, 207).
; PLAN: r0=61(x), r1=207(y), r2=62(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 207
LDI r2, 62
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
