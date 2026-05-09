; DESCRIPTION: Places a blue 96x93 rectangle at position (0, 8).
; PLAN: r0=0(x), r1=8(y), r2=96(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 8
LDI r2, 96
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
