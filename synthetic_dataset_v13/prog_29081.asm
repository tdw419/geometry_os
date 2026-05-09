; DESCRIPTION: Places a purple 86x118 rectangle at position (292, 86).
; PLAN: r0=292(x), r1=86(y), r2=86(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 86
LDI r2, 86
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
