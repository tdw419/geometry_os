; DESCRIPTION: Places a blue 118x93 rectangle at position (77, 121).
; PLAN: r0=77(x), r1=121(y), r2=118(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 121
LDI r2, 118
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
