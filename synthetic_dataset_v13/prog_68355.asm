; DESCRIPTION: Places a purple 78x68 rectangle at position (158, 12).
; PLAN: r0=158(x), r1=12(y), r2=78(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 12
LDI r2, 78
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
