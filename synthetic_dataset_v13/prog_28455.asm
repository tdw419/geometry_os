; DESCRIPTION: Places a purple 61x63 rectangle at position (396, 63).
; PLAN: r0=396(x), r1=63(y), r2=61(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 63
LDI r2, 61
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
