; DESCRIPTION: Places a purple 75x68 rectangle at position (156, 114).
; PLAN: r0=156(x), r1=114(y), r2=75(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 114
LDI r2, 75
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
