; DESCRIPTION: Places a purple 118x48 rectangle at position (120, 89).
; PLAN: r0=120(x), r1=89(y), r2=118(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 89
LDI r2, 118
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
