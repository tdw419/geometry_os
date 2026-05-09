; DESCRIPTION: Places a purple 109x85 rectangle at position (318, 168).
; PLAN: r0=318(x), r1=168(y), r2=109(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 168
LDI r2, 109
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
