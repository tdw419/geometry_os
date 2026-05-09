; DESCRIPTION: Places a purple 57x109 rectangle at position (341, 93).
; PLAN: r0=341(x), r1=93(y), r2=57(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 93
LDI r2, 57
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
