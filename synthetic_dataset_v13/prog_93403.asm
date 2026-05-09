; DESCRIPTION: Places a blue 66x60 rectangle at position (142, 21).
; PLAN: r0=142(x), r1=21(y), r2=66(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 21
LDI r2, 66
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
