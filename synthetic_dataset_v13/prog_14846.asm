; DESCRIPTION: Places a blue 12x93 rectangle at position (463, 48).
; PLAN: r0=463(x), r1=48(y), r2=12(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 48
LDI r2, 12
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
