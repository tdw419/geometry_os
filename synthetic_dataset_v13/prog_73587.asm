; DESCRIPTION: Places a blue 118x74 rectangle at position (48, 100).
; PLAN: r0=48(x), r1=100(y), r2=118(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 100
LDI r2, 118
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
