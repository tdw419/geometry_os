; DESCRIPTION: Places a purple 118x80 rectangle at position (335, 136).
; PLAN: r0=335(x), r1=136(y), r2=118(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 136
LDI r2, 118
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
