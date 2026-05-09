; DESCRIPTION: Places a purple 104x93 rectangle at position (151, 109).
; PLAN: r0=151(x), r1=109(y), r2=104(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 109
LDI r2, 104
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
