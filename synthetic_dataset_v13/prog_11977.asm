; DESCRIPTION: Places a green 118x89 rectangle at position (353, 148).
; PLAN: r0=353(x), r1=148(y), r2=118(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 148
LDI r2, 118
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
